//
//  TestVC.swift
//  Demo
//
//  Created by ZYP on 2023/9/5.
//

import UIKit
import AgoraLyricsScore

class TestVC: UIViewController {
    let k = KaraokeView(frame: .zero)
    override func viewDidLoad() {
        super.viewDidLoad()
        ScoreClaculator.recognize(byfile: "query0017.wav", title: "同桌的你") { (score, error) in
            print("\(score)")
        }
//        let claculator = ScoreClaculator()
//        let timeStamp = Date().timeIntervalSince1970
//        let sign = claculator.sign(httpMethod: "POST",
//                                   httpUri: claculator.path,
//                                   accessKey: claculator.accessKey,
//                                   access_secret: claculator.access_secret,
//                                   dataType: claculator.dataType,
//                                   signatureVersion: claculator.signatureVersion,
//                                   timeStamp: timeStamp)
//        print("timeStamp = \(timeStamp)")
//        print("sign = \(sign)")
//        print("")
//        test1()
//        test2()
        //        test3()
        //        test4()
//        test5()
//        test6()
    }
    
    func test1() { /** yuping 唱全部歌词 **/
        
        let userPitchsName = "yp-1.txt"
        if let scoreRadio = calculatedScore(refPitchsName: "反方向的钟-原唱干声.pitch", userPitchsName: userPitchsName) {
            print("[\(userPitchsName)] 得分比：\(scoreRadio)")
        }
        else {
            print("[\(userPitchsName)] 得分比：-1")
        }
    }
    
    func test2() { /** like 唱全部歌词 **/
        let userPitchsName = "lk-1.txt"
        if let scoreRadio = calculatedScore(refPitchsName: "反方向的钟-原唱干声.pitch", userPitchsName: userPitchsName) {
            print("[\(userPitchsName)] 得分比：\(scoreRadio)")
        }
        else {
            print("[\(userPitchsName)] 得分比：-1")
        }
    }
    
    func test3() { /** like 唱全部歌词 **/
        let userPitchsName = "lk-2.txt"
        if let scoreRadio = calculatedScore(refPitchsName: "反方向的钟-原唱干声.pitch", userPitchsName: userPitchsName) {
            print("[\(userPitchsName)] 得分比：\(scoreRadio)")
        }
        else {
            print("[\(userPitchsName)] 得分比：-1")
        }
    }
    
    func test4() { /** like 唱全部歌词 好耳机 **/
        let userPitchsName = "lk-3.txt"
        if let scoreRadio = calculatedScore(refPitchsName: "反方向的钟-原唱干声.pitch", userPitchsName: userPitchsName) {
            print("[\(userPitchsName)] 得分比：\(scoreRadio)")
        }
        else {
            print("[\(userPitchsName)] 得分比：-1")
        }
    }
    
    func test5() { /** like 唱全部歌词 好耳机 **/
        let userPitchsInput: [Float] = [0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000,
                                        0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 151.920, 141.050, 145.430, 152.010, 155.870, 165.800, 170.850, 176.780, 171.470, 168.820, 169.250, 157.910, 151.250, 0.000, 0.000, 0.000, 177.850, 199.030, 216.710, 149.370, 155.980, 153.850, 153.850, 153.850, 153.850, 153.850, 153.850, 150.650,
                                        136.460, 0.000, 0.000, 0.000, 0.000, 172.470, 184.900, 0.000, 0.000, 0.000, 0.000, 0.000, 119.060, 123.370, 125.000, 127.670, 128.420, 129.740, 130.060, 129.030, 129.030, 125.960, 122.490, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 120.830, 127.730, 118.360, 117.890, 121.410, 124.320, 119.470, 120.240, 115.180, 119.660, 118.940, 119.990, 125.260, 123.590, 114.430, 111.520, 117.220, 122.560, 113.690, 114.090, 119.930, 119.580, 117.160, 113.550, 111.510, 111.930, 117.580, 120.160, 111.350, 109.360, 111.110, 114.070, 115.410, 114.290, 114.290, 114.290, 114.290, 114.290, 114.290, 0.000, 0.000, 0.000, 126.570, 126.990, 129.030, 129.030, 129.030, 131.510, 130.380, 128.640, 129.030, 126.630, 125.260, 120.510, 0.000, 0.000, 131.240, 127.480, 0.000, 0.000, 0.000, 0.000, 95.250, 96.759, 94.196, 97.741, 100.250, 99.866, 100.410, 99.418, 102.700,
                                        103.870, 102.560, 99.926, 100.360, 103.300, 103.280, 103.860, 103.040, 102.370, 102.560, 105.360, 107.800, 107.710, 106.180, 106.270, 105.770, 103.900, 105.260, 107.840, 111.130, 109.990, 109.690, 113.470, 115.890, 116.280, 116.970, 116.300, 117.410, 118.260, 116.190, 113.470, 114.990, 114.490, 113.340, 114.290, 114.290, 112.650, 112.920, 114.380, 112.880, 113.020, 111.350, 123.010, 118.690, 114.560, 117.060, 115.970, 113.370, 112.910, 114.290, 117.030, 115.590, 109.360, 0.000, 0.000, 0.000, 128.010, 119.250, 119.450, 121.210, 121.210, 121.210, 122.510, 125.380, 125.500, 126.400, 127.210, 124.830, 128.880, 127.000, 123.370, 123.570, 118.880, 119.960, 121.510, 121.210, 123.360, 125.430, 127.740, 136.470, 0.000, 0.000, 0.000, 260.690, 258.940, 266.670, 0.000, 132.310, 125.990, 122.350, 121.390, 119.820, 121.210, 121.210, 121.210, 119.460, 120.300, 128.520, 131.570, 128.800,
                                        124.670, 119.880, 0.000, 0.000, 115.880, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 135.260, 0.000, 129.690, 120.930, 114.070, 0.000, 0.000, 198.500, 0.000, 0.000, 0.000, 193.600, 165.100, 148.910, 168.330, 169.330, 172.520, 176.560, 173.910, 170.130, 158.480, 159.610, 176.360, 0.000, 0.000, 0.000, 0.000, 149.200, 150.710, 147.680, 146.190, 148.150, 153.630, 156.440, 153.850, 151.260, 149.780, 148.430, 147.950, 142.320, 141.380, 136.190, 125.670, 121.050, 124.800, 119.220, 119.510, 124.990, 125.870, 128.540, 130.550, 130.430, 126.600, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 119.910, 114.360, 113.030, 114.290, 114.290, 103.330, 113.760, 120.270, 126.840, 128.830, 111.900, 111.640, 121.840, 113.360, 112.220, 114.470, 114.290, 111.520, 113.970, 118.610, 118.800, 119.780, 122.400, 123.100, 0.000,
                                        0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 123.310, 108.110, 106.800, 112.920, 109.690, 114.830, 115.640, 111.730, 120.860, 0.000, 111.900, 114.360, 110.320, 0.000, 0.000, 126.750, 0.000, 131.400, 124.710, 121.400, 124.190, 123.450, 120.410, 116.630, 111.140, 108.540, 105.510, 104.940, 101.020, 99.200, 97.287, 97.451, 99.836, 101.120, 102.270, 108.710, 114.920, 109.200, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 107.110, 104.200, 101.860, 100.340, 101.890, 106.250, 103.390, 100.350, 100.600, 100.740, 102.720, 102.870, 105.370, 103.490, 107.400, 104.720, 101.620, 102.060, 100.880, 99.831, 99.199, 101.380, 105.850, 104.730, 101.510, 108.920, 110.260, 117.550, 108.110, 98.757, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000,
                                        184.460, 186.420, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 140.810, 151.450, 155.990, 163.530, 168.890, 169.030, 166.670, 161.090, 156.060, 160.000, 152.490, 157.550, 176.220, 151.550, 150.120, 147.080, 146.180, 148.150, 148.150, 148.150, 148.150, 148.150, 148.150, 148.150, 148.150, 148.150, 148.150, 156.210, 153.850, 145.260, 148.150, 148.150, 148.150, 150.230, 148.670, 146.460, 148.150, 142.180, 0.000, 0.000, 0.000, 0.000, 173.470, 184.510, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 112.280, 111.000, 113.260, 118.550, 119.090, 125.670, 128.970, 128.360, 130.520, 129.030, 119.030, 111.880, 128.480, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 115.870, 113.270, 115.940, 113.420, 113.480, 114.290, 114.290, 117.120, 115.450, 113.510, 114.290, 117.120,
                                        115.020, 116.570, 114.880, 112.790, 117.520, 124.620, 137.450, 157.000, 0.000, 0.000, 0.000, 0.000, 118.320, 125.690, 125.660, 121.850, 113.970, 113.230, 112.730, 111.730, 109.010, 109.070, 111.520, 110.130, 106.960, 108.110, 108.110, 108.110, 111.840, 115.240, 115.380, 114.290, 114.290, 118.060, 117.160, 117.630, 120.460, 122.220, 122.180, 126.420, 121.270, 120.080, 123.330, 126.050, 125.910, 125.000, 125.000, 125.000, 125.000, 125.000, 125.000, 125.000, 125.000, 125.000, 118.660, 113.360, 117.650, 114.870, 102.630, 144.170, 114.010, 101.570, 94.569, 91.104, 91.319, 95.144, 95.908, 99.570, 101.580, 100.000, 0.000, 0.000, 0.000, 83.718, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 117.000, 110.400, 105.730, 109.580, 112.940, 113.240, 116.730, 114.290, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 127.460, 125.290,
                                        125.850, 127.120, 122.270, 122.840, 126.370, 125.000, 125.000, 122.170, 118.670, 127.270, 136.640, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 155.230, 158.390, 147.960, 145.030, 152.990, 161.960, 161.530, 165.280, 169.470, 166.670, 166.670, 175.870, 176.410, 167.530, 153.050, 167.550, 172.790, 161.000, 158.550, 153.580, 151.650, 153.850, 153.850, 153.850, 153.850, 153.850, 153.850, 149.980, 145.190, 144.960, 141.390, 142.090, 142.860, 142.860, 132.240, 120.780, 121.890, 122.260, 119.560, 129.470, 131.640, 129.030, 121.290, 115.820, 120.150, 122.360, 110.540, 108.180, 111.110, 111.110, 111.110, 109.350, 110.070, 111.540, 112.550,
                                        114.630, 114.530, 114.290, 114.290, 112.470, 112.130, 114.260, 114.060, 114.290, 111.360, 109.880, 111.110, 111.110, 114.360, 115.440, 114.290, 116.150, 114.290, 114.290, 117.650, 108.230, 127.960, 0.000, 0.000, 0.000, 0.000, 0.000, 119.430, 116.190, 121.380, 122.130, 121.210, 124.870, 126.660, 125.000, 125.000, 122.930, 117.700, 112.150, 112.230, 99.413, 0.000, 0.000, 0.000, 0.000, 0.000, 97.428, 101.450, 101.140, 101.450, 100.690, 99.159, 98.370, 98.177, 97.521, 98.376, 97.960, 97.722, 97.687, 98.613, 93.954, 87.722, 93.701, 101.890, 97.561, 99.791, 100.980, 101.480, 104.890, 102.200, 101.270, 99.328, 103.120, 96.235, 105.130, 103.290, 103.470, 106.160, 106.410, 118.730, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000,
                                        0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 372.270, 0.000, 0.000, 142.340, 149.270, 150.000, 155.340, 158.850, 161.600, 164.370, 167.590, 167.490, 166.670, 166.670, 166.670, 166.670, 163.060, 158.220, 158.190, 160.000, 156.090, 152.200, 146.860, 146.130, 148.150, 148.150, 148.150, 150.320, 149.190, 144.810, 144.880, 140.450, 126.820, 0.000, 0.000, 0.000, 0.000, 0.000, 127.350, 117.780, 118.110, 120.980, 119.250, 118.880, 124.940, 125.080, 128.170, 125.240, 123.820, 122.810, 116.890, 112.020, 110.060, 103.660, 100.810, 104.130, 100.340, 103.740, 103.300, 103.640, 111.000, 109.930, 110.850, 110.440, 112.540, 111.440, 110.420, 111.110, 112.710, 111.110, 112.440, 111.510, 103.660, 100.920, 107.970,
                                        110.500, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 121.800, 116.910, 115.120, 114.810, 112.790, 114.290, 116.560, 117.260, 116.460, 117.150, 117.650, 0.000, 0.000, 0.000, 0.000, 0.000, 134.150, 124.160, 123.580, 121.770, 119.940, 121.210, 121.210, 121.210, 124.130, 119.160, 111.560, 106.610, 104.890, 106.700, 104.380, 101.100, 102.060, 100.800, 99.413, 100.410, 101.810, 100.120, 98.976, 101.340, 101.970, 101.930, 103.120, 100.660, 102.060, 103.390, 102.560, 102.560, 99.869, 99.750, 100.140, 102.240, 103.680, 101.690, 101.480, 103.950, 99.558, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 117.340, 109.250, 113.360, 111.930, 108.730, 109.330, 110.050, 107.590, 119.410, 106.330, 113.080, 112.300, 111.110, 111.110, 115.300, 115.020, 114.290, 112.600, 114.290, 112.010, 116.960, 106.410, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000,
                                        120.300, 123.750, 125.000, 122.820, 120.190, 124.680, 124.340, 124.790, 120.950, 116.770, 0.000, 0.000, 0.000, 122.400, 0.000, 0.000, 124.910, 131.790, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 127.660, 133.540, 148.180, 162.780, 166.100, 171.170, 167.920, 159.940, 162.510, 168.410, 168.410, 166.670, 166.670, 166.670, 166.670, 0.000, 169.730, 149.670, 143.950, 148.150, 148.150, 148.150, 148.150, 148.150, 143.830, 146.930, 0.000, 140.390, 147.600, 156.540, 0.000, 0.000, 0.000, 0.000, 125.900, 125.030, 124.940, 123.380, 125.000, 125.000, 125.000, 125.000, 125.000, 125.000, 125.000, 125.000, 115.780, 126.420, 137.170, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 120.500, 114.970, 114.180, 111.180, 106.600, 109.130, 112.120, 111.110, 111.110, 106.210, 103.210,
                                        109.330, 110.180, 109.600, 108.300, 105.880, 109.100, 109.310, 108.110, 108.110, 90.001, 0.000, 0.000, 0.000, 182.030, 165.330, 126.330, 112.780, 111.520, 113.510, 114.290, 114.290, 114.290, 114.290, 113.130, 110.610, 109.540, 111.110, 115.240, 113.590, 110.360, 110.230, 111.110, 112.950, 118.990, 114.760, 122.710, 116.470, 115.380, 117.950, 115.620, 116.890, 118.020, 119.630, 122.210, 122.070, 121.210, 126.190, 126.390, 125.000, 121.340, 121.080, 120.580, 116.490, 116.890, 114.050, 124.270, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 85.388, 0.000, 0.000, 106.610, 98.523, 98.346, 98.500, 99.738, 102.270, 104.640, 109.170, 101.980, 94.306, 86.010, 90.338, 0.000, 94.285, 0.000, 0.000, 116.240, 112.970, 113.010, 113.640, 110.310, 110.390, 111.110, 108.770, 110.880, 105.940, 106.750, 106.100, 107.410, 108.370, 106.400,
                                        107.310, 111.220, 115.460, 107.910, 104.310, 104.270, 112.170, 109.180, 104.140, 104.180, 106.260, 117.230, 105.570, 113.240, 122.730, 119.060, 117.650, 117.650, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 222.220, 203.750, 200.820, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000,
                                        0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 203.810, 210.530, 206.120, 179.110, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000,
                                        0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000]
        
        let userPitchsName = "x.txt"
        let refPitchUrl = URL(fileURLWithPath: Bundle.main.path(forResource: "反方向的钟-原唱干声.pitch", ofType: nil)!)
        let refPitchData = try! Data(contentsOf: refPitchUrl)
        let refModel = KaraokeView.parsePitchData(data: refPitchData)!
        let refPitchs = refModel.items.map({ Float($0.value) })
//        let finalScore = ScoreClaculator.calculateMuti(refPitchInterval: 10,
//                                      userPitchInterval: 16,
//                                      refPitchs: refPitchs,
//                                      userPitchs: userPitchsInput)
//        if let score = finalScore {
//            print("finalScore:\(score)")
//        }
//        else {
//            print("no score")
//        }
    }
    
    func test6() { /** 乱唱 **/
        let userPitchsInput: [Float] = [0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 206.320, 210.020, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 159.960, 0.000, 0.000, 121.510, 117.770, 119.840, 128.800, 137.280, 122.180, 131.140, 137.590, 137.820, 135.370, 133.060, 133.330, 129.490, 122.940, 121.120, 123.990, 126.670, 101.860, 94.406, 97.630, 0.000, 0.000, 0.000, 0.000, 122.680, 112.930, 113.760, 112.850, 114.290, 114.290, 112.730, 112.520, 100.250, 0.000, 0.000, 0.000, 122.250, 117.170, 0.000, 0.000, 126.370, 125.000, 125.000, 122.990, 121.810,
                                        113.510, 114.590, 116.150, 106.450, 104.440, 104.700, 100.250, 98.749, 96.973, 99.495, 101.430, 97.999, 96.284, 98.478, 102.170, 100.210, 116.540, 122.480, 120.100, 121.440, 122.360, 121.210, 117.420, 116.230, 115.680, 113.330, 110.220, 101.980, 100.450, 103.230, 109.400, 105.620, 111.930, 115.610, 115.230, 110.350, 103.560, 103.550, 108.430, 107.720, 104.940, 105.010, 105.260, 106.460, 104.310, 105.610, 105.790, 106.570, 115.820, 118.100, 113.480, 113.300, 117.140, 116.980, 117.830, 110.330, 106.270, 105.210, 106.500, 108.490, 110.460, 115.300, 119.840, 121.140, 124.640, 123.130, 122.250, 116.580, 107.940, 108.860, 0.000, 0.000, 0.000, 119.540, 116.260, 107.340, 104.300, 110.230, 103.810, 104.180, 101.870, 111.720, 102.880, 112.240, 124.430, 0.000, 0.000, 0.000, 0.000, 117.430, 109.360, 102.690, 102.190, 101.870, 102.000, 99.813, 96.621, 96.585, 94.576, 93.207,
                                        100.880, 107.300, 105.610, 115.630, 123.110, 119.020, 113.510, 111.250, 104.170, 101.200, 103.740, 95.322, 93.723, 0.000, 0.000, 0.000, 416.090, 0.000, 151.290, 152.720, 150.450, 0.000, 0.000, 0.000, 0.000, 112.190, 103.600, 102.450, 104.780, 102.400, 100.170, 99.314, 98.987, 100.000, 100.000, 106.790, 106.160, 103.150, 102.990, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 115.860, 121.530, 131.190, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 153.940, 157.720, 148.000, 138.590, 130.110, 140.180, 156.320, 139.670, 119.440, 109.990, 108.470, 109.480, 111.110, 104.420, 100.730, 111.110, 113.770, 116.840, 113.060, 111.500, 109.290, 108.970, 112.760, 106.550, 111.450, 105.030, 105.850, 0.000, 0.000, 113.540, 110.130, 106.260, 106.850, 107.370,
                                        107.600, 106.900, 110.250, 106.410, 107.250, 108.390, 109.700, 115.050, 114.870, 112.160, 109.930, 108.310, 109.330, 105.070, 101.470, 102.800, 108.640, 106.270, 111.240, 113.480, 110.440, 114.060, 114.220, 115.420, 120.130, 119.680, 116.950, 117.580, 139.090, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 103.730, 108.270, 119.340, 117.590, 0.000, 0.000, 122.510, 120.720, 0.000, 107.830, 99.436, 100.620, 102.560, 100.100, 99.069, 98.716, 103.780, 104.380, 102.560, 106.110, 110.480, 103.580, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 146.300, 113.350, 108.520, 112.110, 109.690, 107.380, 110.770, 115.580, 115.350, 114.290, 115.750, 118.550, 0.000, 0.000, 0.000, 0.000, 0.000, 107.030, 100.960, 102.950, 104.550, 103.870, 113.740, 0.000, 130.530, 144.690, 157.810, 0.000, 0.000, 109.920, 102.820, 98.765,
                                        99.018, 91.098, 93.901, 98.489, 97.171, 97.423, 98.200, 99.361, 104.210, 106.920, 109.370, 110.880, 115.460, 115.310, 113.430, 112.100, 110.410, 116.530, 121.360, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 359.920, 327.770, 0.000, 0.000, 0.000, 0.000, 0.000, 98.692, 100.590, 99.377, 97.982, 100.040, 100.240, 100.000, 100.000, 97.999, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 86.755, 0.000, 0.000, 87.311, 81.927, 79.794, 83.391, 86.559, 0.000, 0.000, 110.890, 110.020, 106.050, 103.830, 106.030, 104.970, 103.860, 104.940, 0.000, 0.000, 0.000, 0.000, 0.000, 90.649, 92.208, 93.977, 92.901, 94.845, 90.308, 87.629, 82.670, 81.501, 81.195, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 92.859, 93.867, 96.073, 89.861, 89.381, 93.072, 99.924, 96.327, 81.886, 90.224, 0.000, 0.000, 0.000,
                                        0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 78.824, 172.200, 158.630, 136.050, 150.410, 147.860, 142.090, 134.660, 135.590, 0.000, 0.000, 0.000, 0.000, 104.560, 99.630, 100.980, 102.710, 106.120, 107.540, 103.800, 106.860, 111.230, 110.320, 100.240, 114.640, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 116.500, 115.470, 113.350, 114.190, 114.970, 112.350, 108.620, 105.030, 103.580, 99.116, 97.586, 97.834, 97.049, 102.010, 114.110, 0.000, 0.000, 0.000, 217.960, 222.720, 0.000, 242.390, 240.890, 160.840, 154.220, 0.000, 0.000, 0.000, 0.000, 104.170, 95.605, 96.143, 102.030, 0.000, 103.950, 104.590, 124.550, 115.350, 107.780, 104.700, 103.680, 104.600, 105.260, 105.260, 101.930, 97.996, 99.401, 102.810, 105.280, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000,
                                        0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 119.070, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 135.850, 117.000, 116.780, 115.200, 113.340, 120.560, 0.000, 0.000, 0.000, 0.000, 0.000, 105.890, 108.450, 110.310, 113.590, 112.960, 111.000, 113.180, 119.120, 128.580, 125.220, 119.450, 120.440, 117.460, 116.280, 114.180, 112.860, 107.620, 103.940, 106.290, 105.390, 100.280, 100.780,
                                        105.060, 106.520, 105.870, 102.510, 100.130, 102.560, 102.560, 104.440, 103.240, 104.720, 106.260, 103.240, 102.660, 107.370, 112.780, 114.420, 107.450, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 99.202, 99.036, 99.417, 96.895, 95.261, 97.561, 99.264, 100.670, 103.220, 106.310, 109.070, 112.250, 120.130, 125.980, 129.970, 131.000, 129.840, 121.790, 117.250, 112.570, 108.710, 108.260, 101.090, 101.460, 103.130, 98.632, 98.014, 96.812, 94.554, 92.238, 92.300, 90.893, 93.779, 99.036, 95.313, 90.456, 90.904, 106.670, 109.560, 115.410, 120.490, 121.170, 122.180, 121.930, 117.670, 116.150, 113.470, 110.220, 110.370, 111.110, 0.000, 0.000, 114.430, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 119.010, 97.727, 96.823, 0.000, 0.000, 0.000, 116.420, 115.630, 120.310, 112.930, 118.750, 117.390,
                                        120.080, 123.520, 121.830, 121.210, 121.210, 121.210, 117.790, 116.570, 114.150, 111.280, 110.380, 107.430, 102.910, 97.284, 100.370, 104.930, 102.920, 102.440, 102.560, 102.560, 105.310, 99.398, 100.290, 110.650, 114.840, 125.580, 132.330, 134.210, 133.580, 0.000, 0.000, 0.000, 119.890, 116.980, 110.940, 110.230, 110.520, 108.120, 110.360, 110.520, 104.800, 104.990, 105.410, 106.780, 109.300, 109.820, 113.380, 119.610, 118.240, 128.620, 0.000, 145.950, 149.520, 0.000, 119.420, 118.760, 115.940, 116.270, 115.480, 115.310, 112.590, 111.140, 0.000, 100.510, 0.000, 0.000, 0.000, 0.000, 0.000, 110.280, 108.800, 117.210, 121.350, 104.020, 96.655, 113.490, 114.110, 120.750, 118.620, 117.650, 115.310, 112.030, 109.410, 111.970, 109.690, 103.690, 103.270, 108.820, 106.790, 97.859, 110.510, 107.290, 101.370, 101.020, 99.683, 100.000, 104.400, 104.120, 99.341, 101.930,
                                        105.070, 120.780, 126.650, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 406.770, 400.000, 326.480, 0.000, 0.000, 0.000, 127.190, 123.260, 119.220, 111.060, 103.900, 98.765, 97.513, 98.315, 99.368, 101.090, 98.530, 104.200, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 115.650, 113.990, 116.580, 0.000, 0.000, 0.000, 0.000, 115.410, 111.330, 108.720, 109.000, 117.310, 111.460, 109.660, 112.280, 114.390, 116.650, 121.040, 117.280, 114.210, 114.700, 113.760, 110.220, 109.890, 111.110, 109.910, 104.140, 99.249, 102.250, 100.840, 96.725, 101.830, 107.990, 101.390, 104.590, 105.360, 105.620, 105.260, 106.600, 103.400, 104.690, 106.060, 100.850, 0.000, 0.000, 0.000, 0.000, 97.356, 97.191, 0.000, 0.000,
                                        0.000, 375.680, 373.090, 350.790, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 142.210, 149.370, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 125.470, 119.080, 120.010, 120.500, 121.210, 115.690, 116.840, 134.390, 133.090, 125.550, 123.190, 122.730, 120.140, 120.300, 118.920, 118.200, 121.390, 145.370, 114.870, 0.000, 118.400, 115.290, 118.110, 120.380, 128.670, 124.330, 115.710, 114.960, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 140.610, 121.650, 113.840, 110.780, 112.190, 116.160, 111.240, 111.330, 100.800, 0.000, 118.690, 113.170, 107.180, 106.120, 103.380, 104.390, 109.670, 123.280, 135.090, 119.270, 109.680, 108.750, 105.270, 120.280, 120.750, 116.360, 112.290, 111.850, 110.960, 110.920, 109.020, 106.140, 107.540, 109.520, 104.210, 102.010, 99.627, 97.066, 96.904, 98.006, 98.861, 103.790, 101.900, 95.076,
                                        95.704, 97.692, 111.210, 111.240, 112.610, 0.000, 0.000, 0.000, 0.000, 0.000, 160.320, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 310.830, 0.000, 128.620, 125.370, 124.450, 125.000, 119.850, 113.610, 108.190, 105.040, 93.712, 101.160, 105.520, 101.480, 94.372, 96.953, 92.828, 93.148, 99.934, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 122.640, 116.220, 106.340, 119.380, 0.000, 0.000, 0.000, 0.000, 0.000, 102.120, 100.700, 119.970, 130.080, 108.480, 98.446, 102.230, 110.880, 131.310, 123.860, 113.740, 111.560, 113.390, 108.710, 108.020, 108.810, 103.490, 101.310, 102.260, 102.690, 93.881, 96.878, 101.060, 100.990, 100.740, 97.415, 93.882, 96.008, 98.310, 102.340,
                                        102.330, 100.160, 104.360, 104.080, 100.280, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 109.770, 104.880, 107.160, 105.050, 96.248, 110.940, 95.256, 105.710, 0.000, 121.250, 118.010, 111.190, 108.940, 111.110, 112.790, 108.180, 101.730, 98.565, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 120.820, 113.820, 110.720, 107.280, 102.680, 115.770, 121.490, 111.470, 112.010, 113.520, 112.440, 108.940, 106.550, 107.450, 108.110, 114.280, 111.550, 113.540, 113.030, 107.310, 105.920, 109.200, 108.410, 107.010, 105.610, 103.910, 105.260, 107.780, 104.710, 99.602, 99.031, 99.120, 103.190, 99.919, 98.155, 100.500, 102.180, 104.550, 111.150, 105.470, 110.430, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000,
                                        0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 359.250, 363.940, 128.780, 126.310, 126.780, 127.110, 130.960, 132.990, 130.940, 125.780, 121.660, 120.130, 122.240, 121.140, 120.370, 117.910, 116.270, 109.680, 97.345, 97.546, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 118.260, 111.580, 108.620, 101.270, 106.960, 121.180, 128.130, 108.650, 103.520, 106.180, 105.550, 100.780, 96.565, 0.000, 129.200, 132.700, 118.810, 114.290, 116.300, 113.270, 113.660, 114.290, 114.290, 112.560, 107.490, 106.720, 109.180, 108.430, 107.060, 95.855, 95.395, 105.790, 104.600, 97.482, 96.256, 99.463, 100.220, 101.440, 99.302, 99.079, 104.940, 111.460, 109.780, 0.000, 0.000, 114.890, 0.000, 129.340, 112.790, 129.090, 146.010, 0.000, 185.060, 173.910, 166.030, 209.180, 200.000, 248.280, 266.430, 233.590, 224.840, 234.120, 250.250, 188.450, 178.670,
                                        189.850, 0.000, 0.000, 0.000, 0.000, 108.460, 104.990, 114.350, 127.380, 108.720, 102.780, 104.000, 105.710, 102.520, 99.363, 99.566, 99.980, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 123.720, 116.990, 115.000, 108.830, 104.810, 95.628, 0.000, 100.750, 0.000, 105.890, 109.880, 107.580, 108.700, 112.010, 110.680, 114.750, 117.970, 118.450, 116.990, 113.530, 111.470, 110.130, 107.060, 110.320, 101.120, 98.137, 101.960, 103.580, 102.090, 101.990, 101.970, 107.370, 96.195, 97.844, 94.999, 94.451, 100.770, 104.950, 105.530, 99.316, 91.954, 89.597, 94.591, 100.980, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 102.450, 99.628, 104.550, 113.230, 114.250, 112.380, 130.730, 114.240, 111.790,
                                        107.600, 100.840, 97.784, 99.934, 94.533, 96.696, 93.957, 0.000, 0.000, 0.000, 0.000, 0.000, 90.909, 0.000, 0.000, 0.000, 0.000, 113.710, 111.890, 108.620, 103.190, 105.690, 0.000, 0.000, 0.000, 107.760, 101.650, 101.040, 102.710, 105.930, 108.880, 109.020, 108.110, 108.110, 111.290, 115.540, 118.830, 114.560, 109.360, 108.310, 108.130, 108.370, 104.570, 100.580, 99.089, 100.760, 103.450, 100.920, 96.887, 98.749, 100.130, 98.392, 98.887, 97.511, 97.336, 97.561, 98.851, 100.600, 97.309, 93.196, 94.166, 105.260, 109.010, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 98.311, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 321.280, 343.950, 337.310, 0.000, 0.000, 0.000, 0.000, 238.620, 208.430, 238.370, 225.920, 0.000, 0.000, 98.815, 99.691, 104.690, 105.980, 103.820, 105.090, 100.890, 108.650, 103.060,
                                        102.560, 103.790, 101.550, 103.040, 95.520, 0.000, 99.638, 95.024, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 79.535, 0.000, 0.000, 119.430, 108.000, 107.260, 99.553, 107.620, 144.150, 117.140, 109.890, 107.530, 103.260, 102.590, 106.720, 103.390, 101.010, 0.000, 0.000, 118.150, 121.490, 121.490, 118.840, 111.280, 112.610, 113.160, 108.120, 106.900, 108.110, 106.750, 104.880, 97.285, 102.790, 103.240, 96.043, 90.820, 103.420, 101.600, 97.943, 99.634, 100.530, 97.458, 98.713, 102.720, 103.650, 104.530, 96.480, 94.894, 96.149, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 95.022, 0.000, 90.644, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 212.990, 210.530, 0.000, 140.210, 101.830, 101.510, 102.560, 105.470, 104.670, 100.560, 102.350, 105.630, 99.245, 108.220, 104.540, 101.190, 100.130, 97.671, 99.936,
                                        103.360, 102.980, 98.193, 97.263, 99.692, 100.170, 100.000, 101.500, 98.614, 96.529, 99.028, 92.400, 93.413, 98.357, 98.303, 97.140, 99.771, 100.620, 103.350, 103.660, 102.560, 101.120, 107.780, 120.600, 98.060, 101.160, 115.160, 121.760, 118.460, 107.350, 106.270, 106.550, 104.670, 106.050, 110.780, 111.120, 111.680, 115.260, 112.440, 111.740, 101.940, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 102.330, 106.220, 103.160, 102.910, 101.590, 96.903, 131.000, 120.110, 0.000, 0.000, 0.000, 122.550, 120.500, 114.970, 106.510, 105.070, 97.952, 96.239, 98.162, 96.442, 95.254, 94.810, 95.639, 98.397, 100.170, 109.140, 113.260, 118.100, 119.530, 114.950, 114.020, 101.860, 94.777, 89.487, 0.000, 0.000, 0.000, 0.000, 0.000, 191.860, 0.000, 0.000, 0.000, 405.190, 288.770, 245.790, 0.000, 111.540, 108.290, 102.670, 100.700, 101.750, 101.640,
                                        101.620, 105.150, 98.523, 0.000, 0.000, 110.520, 113.270, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 461.050, 0.000, 0.000, 0.000, 0.000, 0.000, 118.870, 119.990, 124.550, 126.670, 130.100, 127.340, 128.790, 130.510, 131.770, 134.850, 134.880, 135.070, 133.560, 136.860, 149.940, 0.000, 134.940, 137.930, 142.700, 139.170, 148.370, 152.510, 138.000, 133.080, 140.520, 137.160, 129.690, 138.440, 114.690, 106.190, 0.000, 137.830, 0.000, 0.000, 131.090, 168.360, 169.170, 162.000, 163.140, 166.050, 145.410, 161.990, 167.250, 171.140, 167.700, 159.840, 164.040, 177.090, 169.800, 0.000, 0.000, 0.000, 0.000, 120.560, 125.120, 135.830, 126.680, 123.900, 122.370, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000,
                                        0.000, 0.000, 0.000, 118.140, 0.000, 0.000, 0.000, 118.780, 0.000, 115.590, 0.000, 0.000, 0.000, 0.000, 0.000, 176.270, 169.350, 172.500, 169.060, 166.240, 173.120, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 127.400, 0.000, 0.000, 123.700, 126.630, 127.350, 130.610, 132.630, 126.840, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 116.830, 118.520, 122.360, 115.880, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 119.500, 0.000, 0.000, 0.000]
        let userPitchsName = "x.txt"
        
        let refPitchUrl = URL(fileURLWithPath: Bundle.main.path(forResource: "反方向的钟-原唱干声.pitch", ofType: nil)!)
        let refPitchData = try! Data(contentsOf: refPitchUrl)
        let refModel = KaraokeView.parsePitchData(data: refPitchData)!
        let refPitchs = refModel.items.map({ Float($0.value) })
//        let finalScore = ScoreClaculator.calculateMuti(refPitchInterval: 10,
//                                      userPitchInterval: 16,
//                                      refPitchs: refPitchs,
//                                      userPitchs: userPitchsInput)
//        if let score = finalScore {
//            print("finalScore:\(score)")
//        }
//        else {
//            print("no score")
//        }
    }
    
    func calculatedScore(refPitchsName: String,
                         userPitchsName: String,
                         refPitchInterval: Float = 10,
                         userPitchInterval: Float = 32,
                         userPitchsInput: [Float]? = nil) -> Float? {
        let refPitchUrl = URL(fileURLWithPath: Bundle.main.path(forResource: refPitchsName, ofType: nil)!)
        let refPitchData = try! Data(contentsOf: refPitchUrl)
        let refModel = KaraokeView.parsePitchData(data: refPitchData)!
        let refPitchs = refModel.items.map({ Float($0.value) })
        
        let fileUrl = URL(fileURLWithPath: Bundle.main.path(forResource: userPitchsName, ofType: nil)!)
        let fileData = try! Data(contentsOf: fileUrl)
        let pitchFileString = String(data: fileData, encoding: .utf8)!
        let userPitchs = parse(pitchFileString: pitchFileString).map({ Float($0) })
        return nil
//        return ScoreClaculator.calculateMuti(refPitchInterval: refPitchInterval,
//                                             userPitchInterval: userPitchInterval,
//                                             refPitchs: refPitchs,
//                                             userPitchs: userPitchs)
        
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
    
}
