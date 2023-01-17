//
//  IGFeedPostActionsTableViewCell.swift
//  CloneInstagramApp
//
//  Created by HOANG LINH on 05/01/2023.
//

import UIKit
protocol IGFeedPostActionsTableViewCellDelegate: AnyObject {
    func didTapLikePostButton()
    func didTapCommentPostButton()
    func didTapSharePostButton()
    func didTapSavePostButton()
}
class IGFeedPostActionsTableViewCell: UITableViewCell {
    
    weak var delegate: IGFeedPostActionsTableViewCellDelegate?
    static let indetifier = "IGFeedPostActionsTableViewCell"
    
    private let likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "heart"),
                        for: .normal)
        button.tintColor = .label
        return button
    }()
    
    private let commentButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "comment"),
                        for: .normal)
        button.tintColor = .label
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "share"),
                        for: .normal)
        button.tintColor = .label
        return button
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "save"),
                        for: .normal)
        button.tintColor = .label
        return button
    }()
    
    private func addSubviews(){
        contentView.addSubview(likeButton)
        contentView.addSubview(commentButton)
        contentView.addSubview(shareButton)
        contentView.addSubview(saveButton)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        likeButton.addTarget(self,
                             action: #selector(didTapLikePostButton),
                             for: .touchUpInside)
        commentButton.addTarget(self,
                                action: #selector(didTapCommentPostButton),
                                for: .touchUpInside)
        shareButton.addTarget(self,
                              action: #selector(didTapSharePostButton),
                              for: .touchUpInside)
        saveButton.addTarget(self,
                             action: #selector(didTapSavePostButton),
                             for: .touchUpInside)
    }
    @objc private func didTapLikePostButton(){
        delegate?.didTapLikePostButton()
    }
    @objc private func didTapCommentPostButton(){
        delegate?.didTapCommentPostButton()
    }
    @objc private func didTapSharePostButton(){
        delegate?.didTapSharePostButton()
    }
    @objc private func didTapSavePostButton(){
        delegate?.didTapSavePostButton()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with post: UserPost){
        //configure cell
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //configure button action like,comment,share, save
        let buttonSize = contentView.height - 20
        let buttons = [likeButton,
                       commentButton,
                       shareButton]
        for x in 0..<buttons.count {
            let button = buttons[x]
            button.frame = CGRect(x: (CGFloat(x) * buttonSize) + (5 + CGFloat(x+1)),
                                  y: 10,
                                  width: buttonSize,
                                  height: buttonSize)
        }
        
        saveButton.frame = CGRect(x: shareButton.right + 265,
                                   y: 20,
                                   width: buttonSize / 2,
                                   height: buttonSize / 2)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}
