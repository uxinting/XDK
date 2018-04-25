//
//  XData.swift
//  XDK
//
//  Created by Wu,Xinting on 2018/4/25.
//

import UIKit
import MJExtension

open class XData: NSObject {
    
    open func load(keyValues: AnyHashable?) -> XData {
        if let data = keyValues {
            type(of: self).mj_setupReplacedKey { () -> [AnyHashable : Any]? in
                let pptMap = type(of: self).propertyMap()
                return AnyHashable(pptMap) as? [AnyHashable : Any]
            }
            self.mj_setKeyValues(data)
        }
        return self
    }
    
    open func dump() -> AnyHashable {
        return self.mj_keyValues()
    }
    
    /// 返回属性与json中属性的一一对应映射表
    ///
    /// - Returns: 映射表
    open class func propertyMap() -> NSDictionary {
        return [:]
    }
    
    /// 返回数组属性中的解析类名
    ///
    /// - Returns: 解析类名的映射
    open class func arrayPropertyMap() -> NSDictionary {
        return [:]
    }
}
