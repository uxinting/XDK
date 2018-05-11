//
//  XDKLocation.swift
//  XDK
//
//  Created by Wu,Xinting on 2018/5/10.
//

import UIKit
import AddressBookUI

open class XDKLocation: XData {
    open var addressDictionary: [AnyHashable : Any]?
    
    open var addressString: String? {
        get {
            if let addrInfo = addressDictionary {
                let addrStr =  ABCreateStringWithAddressDictionary(addrInfo, false)
                return addrStr.replacingOccurrences(of: "\n", with: " ")
            } else {
                return ""
            }
        }
    }
}
