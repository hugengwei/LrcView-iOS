//
//  VoicePitchChanger.swift
//  AgoraLyricsScore
//
//  Created by ZYP on 2022/11/23.
//

import Foundation

class VoicePitchChanger {
    var offset: Double = 0.0
    var n: Double = 0
    
    /// 处理Picth
    /// - Parameters:
    ///   - wordPitch: 标准值 来自歌词文件
    ///   - voicePitch: 实际值 来自rtc回调
    ///   - wordMaxPitch: 最大值 来自标准值
    /// - Returns: 处理后的值
    func handlePitch(stdPitch: Double,
                     voicePitch: Double,
                     wordMaxPitch: Double) -> Double {
        if voicePitch <= 0 {
            return 0
        }
        
        n += 1.0
        let gap = stdPitch - voicePitch
        
        offset = offset * (n - 1)/n + gap/n
        
        if offset < 0 {
            offset = max(offset, -1 * wordMaxPitch * 0.4)
        }
        else {
            offset = min(offset, wordMaxPitch * 0.4)
        }
        
        if abs(voicePitch - stdPitch) < 1 { /** 差距过小，直接返回 **/
            return voicePitch
        }
        
        switch n {
        case 1:
            return min(voicePitch + 0.5 * offset, wordMaxPitch)
        case 2:
            return min(voicePitch + 0.6 * offset, wordMaxPitch)
        case 3:
            return min(voicePitch + 0.7 * offset, wordMaxPitch)
        case 4:
            return min(voicePitch + 0.8 * offset, wordMaxPitch)
        case 5:
            return min(voicePitch + 0.9 * offset, wordMaxPitch)
        default:
            return min(voicePitch + offset, wordMaxPitch)
        }
    }
    
    func reset() {
        offset = 0.0
        n = 0.0
    }
}

