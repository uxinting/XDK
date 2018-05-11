//
//  XDKLocationManager.swift
//  XDK
//
//  Created by Wu,Xinting on 2018/5/10.
//

import UIKit
import CoreLocation

open class XDKLocationManager: NSObject, CLLocationManagerDelegate {
    open static var sharedInstace: XDKLocationManager = XDKLocationManager()
    
    var cllManager: CLLocationManager = CLLocationManager()
    var compeleteBlock: ((XDKLocation?) -> ())?
    
    public override init() {
        super.init()
        cllManager.desiredAccuracy = kCLLocationAccuracyBest
        cllManager.distanceFilter = 1000.0
        cllManager.delegate = self
    }
    
    open func locate(compeleteBlock: @escaping (XDKLocation?) -> ()) -> () {
        if (self.checkPermission()) {
            self.compeleteBlock = compeleteBlock
            cllManager.startUpdatingLocation()
        } else {
            compeleteBlock(nil)
        }
    }
    
    open func checkPermission(openTip: String? = "请打开定位", requestGrant: Bool = true) -> Bool {
        if !CLLocationManager.locationServicesEnabled() {
            if let tip = openTip {
                print(tip)
            }
            return false
        }
        
        if CLLocationManager.authorizationStatus() == .notDetermined && requestGrant {
            cllManager.requestWhenInUseAuthorization()
            return false
        }
        return true
    }
    
    //MARK: - CLLocationManager
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(locations.last!) { (placemarks, error) in
            if nil == placemarks {
                return
            }
            
            let pm = placemarks![0]
            let xdkLoc: XDKLocation = XDKLocation()
            xdkLoc.addressDictionary = pm.addressDictionary
            self.compeleteBlock!(xdkLoc)
        }
    }
}
