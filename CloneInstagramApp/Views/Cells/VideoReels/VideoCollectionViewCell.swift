//
//  VideoCollectionViewCell.swift
//  CloneInstagramApp
//
//  Created by HOANG LINH on 30/01/2023.
//

import UIKit
import AVFoundation

class VideoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "VideoCollectionViewCell"
    
    var player: AVPlayer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model: VideoModel){
        contentView.backgroundColor = .red
    }
}
