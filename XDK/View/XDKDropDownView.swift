//
//  XDKDropDownView.swift
//  XDK
//
//  Created by Wu,Xinting on 2018/4/26.
//

import UIKit
import XDP

public protocol XDKDropDownViewDelegate {
    func dropDownView(_ dropDownView: XDKDropDownView!, selectIndex: Int)
}

open class XDKDropDownView: XView, XDKMenuDelegate {
    
    @IBOutlet var view: UIView!
    
    @IBOutlet weak var optionButton: UIButton!
    
    open var options: [XDKMenuItem]? {
        didSet {
            optionsMenu?.options = options
        }
    }
    
    open var delegate: XDKDropDownViewDelegate?
    
    var optionsMenu: XDKMenu?
    
    open var title: String? {
        didSet {
            optionButton.setTitle(title, for: .normal)
        }
    }
    
    @IBAction func optionAction(_ sender: Any) {
        if (options?.count)! <= 0 {
            return
        }
        
        if optionsMenu == nil {
            optionsMenu = XDKMenu(frame: CGRect.zero)
            optionsMenu?.options = options
            optionsMenu?.isHidden = true
            optionsMenu?.delegate = self
        }
        
        if optionsMenu?.superview != nil {
            optionsMenu?.isHidden = true
            optionsMenu?.removeFromSuperview()
        } else {
            optionsMenu?.isHidden = false
            
            optionsMenu?.top = self.bottom
            optionsMenu?.width = 70
            optionsMenu?.height = CGFloat((options?.count)! * 40)
            optionsMenu?.right = self.right
            self.superview?.addSubview(optionsMenu!)
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
        
        options = []
    }
    
    public func menu(menu: XDKMenu?, selectIndex: Int) {
        optionButton.setTitle(options?[selectIndex].itemTitle!, for: .normal)
        self.delegate?.dropDownView(self, selectIndex: selectIndex)
    }
}
