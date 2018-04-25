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
    @objc open var name: NSString!
    @objc open var age: NSNumber!
    @objc open var nick: NSString!

    override open class func propertyMap() -> NSDictionary {
        return [
            "nick" : "nickname"
        ]
    }
}
