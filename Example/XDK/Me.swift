//
//  Me.swift
//  XDK_Example
//
//  Created by Wu,Xinting on 2018/4/25.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit
import XDK

class Me: XData {
    open var name: NSString!
    open var age: NSNumber!
    open var nick: NSString!

    open override func propertyMap() -> [String : String] {
        return [
            "nick" : "nickname"
        ]
    }
}
