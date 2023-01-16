//
//  IGFeedPostActionsTableViewCell.swift
//  CloneInstagramApp
//
//  Created by HOANG LINH on 05/01/2023.
//

import UIKit

class IGFeedPostActionsTableViewCell: UITableViewCell {
    
    static let indetifier = "IGFeedPostActionsTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(){
        //configure cell
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

}
