//
//  IGFeedPostTableViewCell.swift
//  CloneInstagramApp
//
//  Created by HOANG LINH on 05/01/2023.
//

import UIKit

final class IGFeedPostTableViewCell: UITableViewCell {
    
    static let indetifier = "IGFeedPostTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(){
        //configure cell
        
    }
}
