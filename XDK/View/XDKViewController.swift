//
//  XDKViewController.swift
//  XDK
//
//  Created by Wu,Xinting on 2018/4/24.
//

import UIKit

open class XDKViewController: UIViewController {

    override open func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

public extension UIViewController {
    
    struct RuntimeKey {
        static let IntentKey = UnsafeRawPointer(bitPattern: "IntentForViewController".hashValue)
    }
    
    public var intent: Any? {
        get {
            return objc_getAssociatedObject(self, UIViewController.RuntimeKey.IntentKey!)
        }
        set {
            objc_setAssociatedObject(self, UIViewController.RuntimeKey.IntentKey!, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
