//
//  ACLog.swift
//  ACAssessment
//
//  Created by martin on 2016/5/16.
//  Copyright © 2016年 Frainbow. All rights reserved.
//

import Foundation

class ACLog {
    static let sharedInstance: ACLog = ACLog()

    private var logs: [String] = []

    private init() {

    }

    func log(message: String) {
        logs.append("\(NSDate())\n  \(message)")
    }

    func dump() -> String {
        return logs.joinWithSeparator("\n\n")
    }
}
