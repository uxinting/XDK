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
    
    @IBOutlet weak var optionButton: UIButton!
    
    var optionsMenu: XDKMenu?
    
    open var title: String? {
        didSet {
            optionButton.setTitle(title, for: .normal)
        }
    }
    
    @IBAction func optionAction(_ sender: Any) {
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let bundlePath = Bundle(for: type(of: self)).path(forResource: "XDK", ofType: "bundle")
        let bundle = Bundle(path: bundlePath!)
        let nib = UINib(nibName: "DropDown", bundle: bundle)
        self.view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        self.view.frame = bounds
        self.addSubview(view)
    }
}
