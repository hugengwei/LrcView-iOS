//
//  TestEstimateScore.swift
//  AgoraLyricsScore-Unit-Tests
//
//  Created by ZYP on 2023/4/10.
//

import XCTest
@testable import AgoraLyricsScore

/// 测试分数估计
class TestEstimateScore: XCTestCase, ScoringMachineDelegate {
    var vm: ScoringMachine!
    var fileName = ""

    func testBad1_A() {
        fileName = "qilixiang_bad1_50ms_pitch"
        goTest(fileName: fileName, xmlFileName: "660250")
    }

    func testGood1_A() {
        fileName = "qilixiang_good1_50ms_pitch"
        goTest(fileName: fileName, xmlFileName: "660250")
    }

    func testGood2_A() {
        fileName = "qilixiang_good2_50ms_pitch"
        goTest(fileName: fileName, xmlFileName: "660250")
    }

    func testGood3_A() {
        fileName = "qilixiang_good3_50ms_pitch"
        goTest(fileName: fileName, xmlFileName: "660250")
    }

    func testGood4_A() {
        fileName = "qilixiang_good4_50ms_pitch"
        goTest(fileName: fileName, xmlFileName: "660250")
    }

    func testBad1_B() {
        fileName = "houlai_bad1_50ms_pitch"
        goTest(fileName: fileName, xmlFileName: "900318")
    }

    func testGood1_B() {
        fileName = "houlai_good1_50ms_pitch"
        goTest(fileName: fileName, xmlFileName: "900318")
    }

    func testGood2_B() {
        fileName = "houlai_good2_50ms_pitch"
        goTest(fileName: fileName, xmlFileName: "900318")
    }

    func goTest(fileName: String, xmlFileName: String) {
        vm = ScoringMachine()
        let url = URL(fileURLWithPath: Bundle.current.path(forResource: xmlFileName, ofType: "xml")!)
        let data = try! Data(contentsOf: url)
        guard let model = KaraokeView.parseLyricData(data: data) else {
            XCTFail()
            return
        }

        let fileUrl = URL(fileURLWithPath: Bundle.current.path(forResource: fileName, ofType: "txt")!)
        let fileData = try! Data(contentsOf: fileUrl)
        let pitchFileString = String(data: fileData, encoding: .utf8)!
        vm.delegate = self
        vm.setLyricData(data: model)
        let pitchs = parse(pitchFileString: pitchFileString)
        var i = 0
        for index in 0...model.duration {
            if index % 20 == 0, index > 0 {
                vm.setProgress(progress: index)
            }
            if index % 50 == 0, index > 0 {
                if i < pitchs.count {
                    let pitch = pitchs[i]
                    vm.setPitch(pitch: pitch)
                    i += 1
                }
            }
            usleep(5)
        }
    }

    private func parse(pitchFileString: String) -> [Double] {
        if pitchFileString.contains("\r\n") {
            let array = pitchFileString.split(separator: "\r\n").map({ Double($0)! })
            return array
        }
        else {
            let array = pitchFileString.split(separator: "\n").map({ Double($0)! })
            return array
        }
    }

    func sizeOfCanvasView(_ scoringMachine: ScoringMachine) -> CGSize {
        return .init(width: 380, height: 100)
    }

    func scoringMachine(_ scoringMachine: ScoringMachine, didUpdateDraw standardInfos: [ScoringMachine.DrawInfo], highlightInfos: [ScoringMachine.DrawInfo]) {

    }

    func scoringMachine(_ scoringMachine: ScoringMachine, didUpdateCursor centerY: CGFloat, showAnimation: Bool, debugInfo: ScoringMachine.DebugInfo) {

    }

    func scoringMachine(_ scoringMachine: ScoringMachine,
                        didFinishLineWith model: LyricLineModel,
                        score: Int,
                        cumulativeScore: Int,
                        lineIndex: Int,
                        lineCount: Int) {
        if lineIndex == 0 {
            print("---------\(fileName)  start ----------")
        }
        print("didFinishLineWith score[\(lineIndex)]: \(score) \(model.content)")
        if lineIndex == 48 {
            print("cumulativeScore:\(cumulativeScore)")
            print("---------\(fileName)  end ----------\n")
        }
    }
}

//class TestEstimateScore: XCTestCase, ScoringMachineDelegate {
//    var vm: ScoringMachine!
//    var fileName = ""
//    let fileNames = ["Alice-song_50ms_pitch",
//    "fzh-song_50ms_pitch",
//    "hmm-song_50ms_pitch",
//    "jt-song_50ms_pitch",
//    "lk-song_50ms_pitch",
//    "wjx-song_50ms_pitch",
//    "ycj-song_50ms_pitch",
//    "zj_song_50ms_pitch"]
//
//    func testBad1_A() {
//        fileName = "Alice-song_50ms_pitch"
//        goTest(fileName: fileName, xmlFileName: "660250")
//    }
//
//    func testBad1_A2() {
//        fileName = "fzh-song_50ms_pitch"
//        goTest(fileName: fileName, xmlFileName: "660250")
//    }
//
//    func testBad1_A3() {
//        fileName = "hmm-song_50ms_pitch"
//        goTest(fileName: fileName, xmlFileName: "660250")
//    }
//
//    func testBad1_A4() {
//        fileName = "jt-song_50ms_pitch"
//        goTest(fileName: fileName, xmlFileName: "660250")
//    }
//
//    func testBad1_A5() {
//        fileName = "lk-song_50ms_pitch"
//        goTest(fileName: fileName, xmlFileName: "660250")
//    }
//
//    func testBad1_A6() {
//        fileName = "wjx-song_50ms_pitch"
//        goTest(fileName: fileName, xmlFileName: "660250")
//    }
//
//    func testBad1_A7() {
//        fileName = "ycj-song_50ms_pitch"
//        goTest(fileName: fileName, xmlFileName: "660250")
//    }
//
//    func testBad1_A8() {
//        fileName = "zj_song_50ms_pitch"
//        goTest(fileName: fileName, xmlFileName: "660250")
//    }
//
//    func goTest(fileName: String, xmlFileName: String) {
//        vm = ScoringMachine()
//        let url = URL(fileURLWithPath: Bundle.current.path(forResource: xmlFileName, ofType: "xml")!)
//        let data = try! Data(contentsOf: url)
//        guard let model = KaraokeView.parseLyricData(data: data) else {
//            XCTFail()
//            return
//        }
//
//        let fileUrl = URL(fileURLWithPath: Bundle.current.path(forResource: fileName, ofType: "txt")!)
//        let fileData = try! Data(contentsOf: fileUrl)
//        let pitchFileString = String(data: fileData, encoding: .utf8)!
//        vm.delegate = self
//        vm.setLyricData(data: model)
//        let pitchs = parse(pitchFileString: pitchFileString)
//        var i = 0
//        for index in 0...model.duration {
//            if index % 20 == 0, index > 0 {
//                vm.setProgress(progress: index)
//            }
//            if index % 50 == 0, index > 0 {
//                if i < pitchs.count {
//                    let pitch = pitchs[i]
//                    vm.setPitch(pitch: pitch)
//                    i += 1
//                }
//            }
//            usleep(5)
//        }
//    }
//
//    private func parse(pitchFileString: String) -> [Double] {
//        if pitchFileString.contains("\r\n") {
//            let array = pitchFileString.split(separator: "\r\n").map({ Double($0)! })
//            return array
//        }
//        else {
//            let array = pitchFileString.split(separator: "\n").map({ Double($0)! })
//            return array
//        }
//    }
//
//    func sizeOfCanvasView(_ scoringMachine: ScoringMachine) -> CGSize {
//        return .init(width: 380, height: 100)
//    }
//
//    func scoringMachine(_ scoringMachine: ScoringMachine, didUpdateDraw standardInfos: [ScoringMachine.DrawInfo], highlightInfos: [ScoringMachine.DrawInfo]) {
//
//    }
//
//    func scoringMachine(_ scoringMachine: ScoringMachine, didUpdateCursor centerY: CGFloat, showAnimation: Bool, debugInfo: ScoringMachine.DebugInfo) {
//
//    }
//
//    func scoringMachine(_ scoringMachine: ScoringMachine,
//                        didFinishLineWith model: LyricLineModel,
//                        score: Int,
//                        cumulativeScore: Int,
//                        lineIndex: Int,
//                        lineCount: Int) {
//        if lineIndex == 0 {
//            print("---------\(fileName)  start ----------")
//        }
//        print("didFinishLineWith score[\(lineIndex)]: \(score) \(model.content)")
//        if lineIndex == 48 {
//            print("cumulativeScore:\(cumulativeScore)")
//            print("---------\(fileName)  end ----------\n")
//        }
//    }
//}
