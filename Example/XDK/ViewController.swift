//
//  ViewController.swift
//  XDK
//
//  Created by uxinting on 04/24/2018.
//  Copyright (c) 2018 uxinting. All rights reserved.
//

import UIKit
import XDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dic: NSDictionary! = [
            "name": "wuxinting",
            "age": 26,
            "nickname" : "xinting",
            "sex": 0,
            "tst": 1,
            "ttt": 22,
            "nums": [40, 41]
        ]
        let me = Me.loadkv(keyValues: dic)
        print(me.dump())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

