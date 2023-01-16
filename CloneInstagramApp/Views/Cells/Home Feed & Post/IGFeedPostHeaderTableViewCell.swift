//
//  IGFeedPostHeaderTableViewCell.swift
//  CloneInstagramApp
//
//  Created by HOANG LINH on 05/01/2023.
//

import UIKit

class IGFeedPostHeaderTableViewCell: UITableViewCell {
    
    static let indetifier = "IGFeedPostHeaderTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBlue
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
