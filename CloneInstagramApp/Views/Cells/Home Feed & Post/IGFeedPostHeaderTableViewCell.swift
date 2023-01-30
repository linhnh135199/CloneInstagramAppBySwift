//
//  IGFeedPostHeaderTableViewCell.swift
//  CloneInstagramApp
//
//  Created by HOANG LINH on 05/01/2023.
//

import UIKit
protocol IGFeedPostHeaderTableViewCellDelegate: AnyObject {
    func didTapMoreButton()
}
class IGFeedPostHeaderTableViewCell: UITableViewCell {
    
    static let indetifier = "IGFeedPostHeaderTableViewCell"
    weak var delegate: IGFeedPostHeaderTableViewCellDelegate?
    
    private let profilePhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 18,weight: .medium)
        return label
    }()
    
    private let moreButton: UIButton = {
       let button = UIButton()
        button.tintColor = .label
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        
        moreButton.addTarget(self,
                             action: #selector(didTapButtonMore),
                             for: .touchUpInside)
    }
    
    @objc private func didTapButtonMore(){
        delegate?.didTapMoreButton()
    }
    
    private func addSubviews(){
        contentView.addSubview(profilePhotoImageView)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(moreButton)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model: User){
        //configure cell
        usernameLabel.text = model.username
        profilePhotoImageView.image = UIImage(named: "avt")
        //.sd_setImage(with: model.profilePhoto,completed: nil)
         
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size = contentView.height - 25
        profilePhotoImageView.frame = CGRect(x: 10,
                                             y: 10,
                                             width: size,
                                             height: size)
        profilePhotoImageView.layer.cornerRadius = size/2
        
        moreButton.frame = CGRect(x: contentView.width - (size - 5),
                                  y: 12,
                                  width: size,
                                  height: size)
        usernameLabel.frame = CGRect(x: profilePhotoImageView.right+10,
                                     y: 0,
                                     width: contentView.width-(size*2)-15,
                                     height: contentView.height-4)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        usernameLabel.text = nil
        profilePhotoImageView.image = nil
    }
}
