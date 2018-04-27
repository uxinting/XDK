//
//  XDKDropDownView.swift
//  XDK
//
//  Created by Wu,Xinting on 2018/4/26.
//

import UIKit

@IBDesignable
open class XDKDropDownView: XView {
    @IBOutlet var view: UIView!
    
    open var title: String? {
        didSet {
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let bundlePath = Bundle(for: type(of: self)).path(forResource: "XDK", ofType: "bundle")
        let bundle = Bundle(path: bundlePath!)
        let nib = UINib(nibName: "DropDown", bundle: bundle)
        self.view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        self.view.frame = bounds
        self.addSubview(view)
//        Bundle.init(path: bundlePath!)?.loadNibNamed("DropDown", owner: self, options: nil)
    }
}
