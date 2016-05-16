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

    private let serialQueue = dispatch_queue_create("ACLog", DISPATCH_QUEUE_SERIAL)
    private var logs: [String] = []

    private init() {

    }

    func log(message: String) {
        logs.append("\(NSDate())\n  \(message)")

        save(dump())
    }

    func dump() -> String {
        return logs.joinWithSeparator("\n\n")
    }
    
    func save(content: NSString) {

        dispatch_async(serialQueue, {
            let home = NSHomeDirectory().stringByAppendingString("/Documents/readme.rtf")
            
            do {
                try content.writeToFile(home, atomically: true, encoding: NSUTF8StringEncoding)
            }
            catch {
                
            }
        })
    }
}
