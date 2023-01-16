//
//  ProfileInfoHeaderCollectionReusableView.swift
//  CloneInstagramApp
//
//  Created by HOANG LINH on 06/01/2023.
//

import UIKit
protocol ProfileInfoHeaderCollectionReusableViewDelegate: AnyObject {
    func profileHeaderDidTapPostButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapFollowerButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapFollowingButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapEditProfileButton(_ header: ProfileInfoHeaderCollectionReusableView)
}

final class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "ProfileInfoHeaderCollectionReusableView"
    public weak var delegate: ProfileInfoHeaderCollectionReusableViewDelegate?
    
    private let profilePhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemBlue
        imageView.image = UIImage(named: "avt")
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let postsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Post", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    private let followingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Following", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    private let followerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Follower", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    private let editProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit your profile", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    
    private let suggetButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "invite"), for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name Demo"
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.text = "DemoDemo"
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        addButtonActions()
        backgroundColor = .systemBackground
        clipsToBounds = true
    }
    private func addButtonActions() {
        followerButton.addTarget(self,
                                 action: #selector(didTapFollowerButton),
                                 for: .touchUpInside)
        followingButton.addTarget(self,
                                  action: #selector(didTapFollowingButton),
                                  for: .touchUpInside)
        postsButton.addTarget(self,
                              action: #selector(didTapPostsButton),
                              for: .touchUpInside)
        editProfileButton.addTarget(self,
                                    action: #selector(didTapEditProfileButton),
                                    for: .touchUpInside)
    }
    
    private func addSubViews() {
        addSubview(profilePhotoImageView)
        addSubview(postsButton)
        addSubview(followerButton)
        addSubview(followingButton)
        addSubview(nameLabel)
        addSubview(editProfileButton)
        addSubview(bioLabel)
        addSubview(suggetButton)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let profilePhotoSize = width/4
        profilePhotoImageView.frame = CGRect(x: 5,
                                             y: 5,
                                             width: profilePhotoSize,
                                             height: profilePhotoSize).integral
        
        profilePhotoImageView.layer.cornerRadius = profilePhotoSize/2.0
        
        let buttonHeight = profilePhotoSize/2
        let countButtonWidth = (width - 10 - profilePhotoSize)/3
        
        postsButton.frame = CGRect(x: profilePhotoImageView.right,
                                   y: 5,
                                   width: countButtonWidth,
                                   height: buttonHeight).integral
        followerButton.frame = CGRect(x: postsButton.right,
                                      y: 5,
                                      width: countButtonWidth,
                                      height: buttonHeight).integral
        followingButton.frame = CGRect(x: followerButton.right,
                                       y: 5,
                                       width: countButtonWidth,
                                       height: buttonHeight).integral
        followingButton.frame = CGRect(x: followerButton.right,
                                       y: 5,
                                       width: countButtonWidth,
                                       height: buttonHeight).integral
        editProfileButton.frame = CGRect(x: profilePhotoImageView.right,
                                         y: 5  + buttonHeight,
                                         width: countButtonWidth * 3,
                                         height: buttonHeight).integral
        
        
        let bioLabelSize = bioLabel.sizeThatFits(frame.size)
        
        nameLabel.frame = CGRect(x: 5,
                                 y: 5  + profilePhotoImageView.bottom,
                                 width: width - 10,
                                 height: 50).integral
        
        bioLabel.frame = CGRect(x: 5,
                                y: nameLabel.bottom - 10,
                                width: width - 10,
                                height: bioLabelSize.height).integral
        
        editProfileButton.frame = CGRect(x: 10,
                                         y: bioLabel.bottom + 20,
                                         width: countButtonWidth * 3.5,
                                         height: bioLabelSize.height + 15).integral
        suggetButton.frame = CGRect(x: editProfileButton.right + 5,
                                    y: bioLabel.bottom + 20,
                                    width: editProfileButton.width/10,
                                    height: editProfileButton.height).integral
    }
    
    //Action event
    
    @objc private func didTapFollowerButton(){
        delegate?.profileHeaderDidTapFollowerButton(self)
    }
    
    @objc private func didTapFollowingButton(){
        delegate?.profileHeaderDidTapFollowingButton(self)
    }
    
    @objc private func didTapEditProfileButton(){
        delegate?.profileHeaderDidTapEditProfileButton(self)
    }
    
    @objc private func didTapPostsButton(){
        delegate?.profileHeaderDidTapPostButton(self)
    }
    
}
