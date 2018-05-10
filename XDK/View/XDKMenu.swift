//
//  XDKMenu.swift
//  XDK
//
//  Created by Wu,Xinting on 2018/4/27.
//

import UIKit

public protocol XDKMenuDelegate {
    func menu(menu: XDKMenu?, selectIndex: Int)
}

public protocol XDKMenuItem {
    var itemTitle: String! { get }
}

open class XDKMenu: XView, UITableViewDataSource, UITableViewDelegate {

    open var delegate: XDKMenuDelegate?
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var options: [XDKMenuItem]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    func setup() {
        let nib = UINib(nibName: "Menu", bundle: Bundle.xdkBundle)
        self.view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        self.view.frame = bounds
        self.addSubview(view)
        
        options = []
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "MenuItem")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "MenuItem")
            cell?.textLabel?.font = UIFont.systemFont(ofSize: 13)
            cell?.textLabel?.textColor = UIColor.darkGray
            cell?.textLabel?.textAlignment = .center
        }
        cell?.textLabel?.text = options![indexPath.row].itemTitle
        return cell!
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (options?.count)!
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.menu(menu: self, selectIndex: indexPath.row)
    }
}
