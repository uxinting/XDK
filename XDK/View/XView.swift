//
//  XView.swift
//  XDK
//
//  Created by Wu,Xinting on 2018/4/25.
//

import UIKit

open class XView: UIView {
}

public extension Bundle {
    public class var xdkBundle: Bundle? {
        get {
            let bundlePath = Bundle(for: XData.classForCoder()).path(forResource: "XDK", ofType: "bundle")
            let bundle = Bundle(path: bundlePath!)
            return bundle
        }
    }
}
