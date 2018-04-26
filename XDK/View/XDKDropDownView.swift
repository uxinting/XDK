//
//  XDKDropDownView.swift
//  XDK
//
//  Created by Wu,Xinting on 2018/4/26.
//

import UIKit

class XDKDropDownView: UIButton {
    open var title: String? {
        didSet {
            self.setTitle(title, for: .normal)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
