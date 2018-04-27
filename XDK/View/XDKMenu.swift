//
//  XDKMenu.swift
//  XDK
//
//  Created by Wu,Xinting on 2018/4/27.
//

import UIKit

public protocol XDKMenuItem {
    var title: String! { get }
}

open class XDKMenu: XView, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var view: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var options: [XDKMenuItem]? {
        didSet {
            tableView.reloadData()
        }
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let nib = UINib(nibName: "Menu", bundle: Bundle.xdkBundle)
        self.view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        self.view.frame = bounds
        self.addSubview(view)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options?.count
    }
}
