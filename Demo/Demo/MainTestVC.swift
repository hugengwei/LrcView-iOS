//
//  MainTestVC2.swift
//  Demo
//
//  Created by ZYP on 2024/4/23.
//

import UIKit
import AgoraLyricsScore
import AgoraRtcKit
import AgoraMccExService

class MainTestVC: UIViewController {
    /// 主视图
    private let mainView = MainView()
    /// MusicContentConter 管理实例
    private let mccManager = MCCManager()
    /// 进度进度校准和进度提供者
    private let progressProvider = ProgressProvider()
    private var songId = 40289835
    var lyricModel: LyricModel!
    fileprivate let logTag = "MainTestVC"
    
    deinit {
        Log.info(text: "deinit", tag: logTag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        commonInit()
        mccManager.initRtcEngine()
        mccManager.joinChannel()
        mccManager.initMccEx()
    }
    
    private func setupUI() {
        view.addSubview(mainView)
        Log.info(text: "setupUI", tag: logTag)
        mainView.frame = view.bounds
        mainView.karaokeView.scoringView.showDebugView = true
    }
    
    private func commonInit() {
        Log.info(text: "commonInit", tag: logTag)
        mainView.delegate = self
        mccManager.delegate = self
        progressProvider.delegate = self
    }
    
    private func setLyricToView() {
        Log.info(text: "setLyricToView", tag: logTag)
        let model = self.lyricModel!
        mainView.karaokeView.setLyricData(data: model)
        mainView.gradeView.setTitle(title: "\(model.name)-\(model.singer)")
    }
    
    private func resetView() {
        Log.info(text: "resetView", tag: logTag)
        mainView.karaokeView.reset()
        mainView.gradeView.reset()
        mainView.incentiveView.reset()
    }
}

// MARK: - RTCManagerDelegate
extension MainTestVC: MCCManagerDelegate {
    func onMccExInitialize(_ manager: MCCManager) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            songId = mccManager.getInternalSongCode(songId: songId)
            mccManager.createMusicPlayer()
            mccManager.preload(songId: songId)
        }
    }
    
    func onProloadMusic(_ manager: MCCManager, songId: Int, lyricData: Data, pitchData: Data) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let model = KaraokeView.parseLyricData(krcFileData: lyricData,
                                                   pitchFileData: pitchData,
                                                   includeCopyrightSentence: false)
            self.lyricModel = model
            setLyricToView()
            manager.startScore(songId: songId)
        }
    }
    
    func onMccExScoreStart(_ manager: MCCManager) {
        manager.open(songId: songId)
    }
    
    func onOpenMusic(_ manager: MCCManager) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            progressProvider.start()
            manager.playMusic()
        }
    }
    
    func onPitch(_ songCode: Int, data: AgoraRawScoreData) {
        let progressGap = calculateProgressGap_debug(progressInMs: data.progressInMs)
        var displayText = "speakerPitch:\(data.speakerPitch) \npitchScore:\(data.pitchScore) \nprogressInMs:\(data.progressInMs)"
        if (progressGap > 50) {
            displayText += "\nprogressGap:\(progressGap)"
        }

        logOnPitchInvokeGap_debug()
        logNInvalidSpeakPitch_debug(data: data)
        
        if data.speakerPitch < 0 {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            mainView.setConsoleText(displayText)
        }

        mainView.karaokeView.setPitch(speakerPitch: Double(data.speakerPitch),
                                      progressInMs: UInt(data.progressInMs))
    }

    func onLineScore(_ songCode: Int, value: AgoraLineScoreData) {
        let score = Int(value.linePitchScore)
        let cumulativeScore = Int(value.cumulativeTotalLinePitchScores)
        let totalScore = value.performedTotalLines * 100
        mainView.lineScoreView.showScoreView(score: score)
        mainView.incentiveView.show(score: score)
        mainView.gradeView.setScore(cumulativeScore: cumulativeScore,
                                    totalScore: Int(totalScore))

    }
}

extension MainTestVC: ProgressProviderDelegate {
    func progressProviderGetPlayerPosition(_ provider: ProgressProvider) -> UInt? {
        let value = mccManager.getMPKCurrentPosition()
        if value < 0 { return nil }
        return UInt(value)
    }
    
    func progressProvider(_ provider: ProgressProvider, shouldSend postion: UInt) {
        
    }
    
    func progressProvider(_ provider: ProgressProvider, didUpdate progressInMs: UInt) {
        mainView.karaokeView.setProgress(progressInMs: progressInMs)
    }
}

// MARK: - MainViewDelegate
extension MainTestVC: MainViewDelegate {
    func mainView(_ mainView: MainView, onAction: MainView.Action) {
        switch onAction {
        case .skip:
            Log.info(text: "skip", tag: self.logTag)
            mccManager.skipMusicPrelude(preludeEndPosition: lyricModel.preludeEndPosition)
            progressProvider.skip(progress: lyricModel.preludeEndPosition)
        case .pause:
            Log.info(text: "pause", tag: self.logTag)
            mccManager.pauseScore()
            mccManager.pauseMusic()
            progressProvider.pause()
        case .set:
            let vc = ParamSetVC()
            vc.delegate = self
            vc.modalPresentationStyle = .pageSheet
            present(vc, animated: true)
        case .change:
            Log.info(text: "change", tag: self.logTag)
            resetView()
        case .quick:
            Log.info(text: "change", tag: self.logTag)
            mccManager.pauseScore()
            mccManager.stopMusic()
            mccManager.leaveChannel()
            progressProvider.stop()
            resetView()
            navigationController?.popViewController(animated: true)
        }
    }
}

// MARK: - ParamSetVCDelegate
extension MainTestVC: ParamSetVCDelegate {
    func didSetParam(param: Param, noLyric: Bool) {
        mainView.updateView(param: param)
    }
}

extension MainTestVC { /** for debug **/
    static var lastProgressInMs: UInt = 0
    static var lastPitchTime:CFAbsoluteTime = 0
    
    func calculateProgressGap_debug(progressInMs: UInt) -> UInt {
        let progressGap = progressInMs - MainTestVC.lastProgressInMs
        MainTestVC.lastProgressInMs = progressInMs
        return progressGap
    }
    
    /// 打印onPitch回调间隔
    func logOnPitchInvokeGap_debug() {
        let startTime = CFAbsoluteTimeGetCurrent()
        let gap = startTime - MainTestVC.lastPitchTime
        MainTestVC.lastPitchTime = startTime
        if (gap > 0.1) {
            Log.warning(text: "OnPitch invoke gap \(gap)", tag: self.logTag)
        }
        else {
            Log.debug(text: "OnPitch invoke gap \(gap)", tag: self.logTag)
        }
    }
    
    // 打印非法的speakerPitch
    func logNInvalidSpeakPitch_debug(data: AgoraRawScoreData) {
        if (data.speakerPitch < 0) {
            Log.errorText(text: "speakerPitch less than 0, \(data.speakerPitch)", tag: self.logTag)
        }
    }
}
