//
//  XTableView.swift
//  XDK
//
//  Created by Wu,Xinting on 2018/4/26.
//

import UIKit

class XTableView: UITableView {

    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.tableFooterView = UIView()
    }

}
