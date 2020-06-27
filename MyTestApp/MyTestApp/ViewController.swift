//
//  ViewController.swift
//  MyTestApp
//
//  Created by hanwe lee on 2020/06/25.
//  Copyright © 2020 hanwe lee. All rights reserved.
//

import UIKit
import HWLogger

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let test:HWLogger = HWLogger()
//        DispatchQueue.global().async {
//            for i in 0..<2000 {
//                usleep(3 * 100 * 1000)
//                test.wrtieLog(logLevel: .debug, message: "global\(i)")
//            }
//        }
//        for i in 0..<2000 {
//
//            usleep(2 * 100 * 1000)
//            test.wrtieLog(logLevel: .debug, message: "\(i)")
//        }
        test.wrtieLog(logLevel: .debug, message: "엥")
//        test.removeTmp()
    }

    

}

