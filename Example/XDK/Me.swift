//
//  Me.swift
//  XDK_Example
//
//  Created by Wu,Xinting on 2018/4/25.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import XDK

enum Sex: Int {
    case Boy = 0
    case Girl
}

class Me: XData {
    open var name: NSString!
    open var age: NSNumber!
    open var nick: NSString!
    open var sex: Sex!
    open var tst: Int!
    open var ttt: NSNumber!
    open var nums: [NSNumber]!

    open override func propertyMap() -> [String : String] {
        return [
            "nick" : "nickname"
        ]
    }
    
    override func enumPropertys() -> [(key: String, (Any?) -> (), () -> Any?)] {
        let enumSex = ("sex", {(v: Any?) in
            self.sex = Sex(rawValue: v as! Int)
        }, {() -> Any? in
            return self.sex.rawValue
        })
        return [enumSex]
    }
}
