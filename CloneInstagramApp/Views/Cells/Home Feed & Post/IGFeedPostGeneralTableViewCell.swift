//
//  IGFeedPostGeneralTableViewCell.swift
//  CloneInstagramApp
//
//  Created by HOANG LINH on 05/01/2023.
//

import UIKit
///Comments
class IGFeedPostGeneralTableViewCell: UITableViewCell {
    
    static let indetifier = "IGFeedPostGeneralTableViewCell"
    
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
