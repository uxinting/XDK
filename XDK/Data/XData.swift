//
//  XData.swift
//  XDK
//
//  Created by Wu,Xinting on 2018/4/25.
//

import UIKit
import EVReflection

open class XData: EVObject {
    
    open class func loadkv(keyValues: AnyHashable?) -> XData {
        return self.init(dictionary: keyValues as! NSDictionary)
    }
    
    open func dump() -> AnyHashable {
        return self.toDictionary()
    }
    
    /// 返回属性与json中属性的一一对应映射表
    ///
    /// - Returns: 映射表
    open func propertyMap() -> [String: String] {
        return [:]
    }
    
    open func enumPropertys() -> [(key: String, (Any?) -> (), () -> Any?)] {
        return []
    }
    
    override open func propertyConverters() -> [(key: String, decodeConverter: ((Any?) -> ()), encodeConverter: (() -> Any?))] {
        return self.enumPropertys()
    }
    
    /// 子类不可重写
    ///
    /// - Returns: []
    override open func propertyMapping() -> [(keyInObject: String?, keyInResource: String?)] {
        let map = self.propertyMap()
        var pMap = [(String?, String?)]()
        for (k, v) in map {
            pMap.append((k, v))
        }
        return pMap
    }
}
