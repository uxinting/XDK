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
            "nickname" : "xinting"
        ]
        let me = Me().load(keyValues: dic)
        print(me.dump())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

