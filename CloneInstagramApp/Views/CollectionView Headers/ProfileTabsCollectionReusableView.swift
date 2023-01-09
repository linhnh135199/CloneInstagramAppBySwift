//
//  ProfileTabsCollectionReusableView.swift
//  CloneInstagramApp
//
//  Created by HOANG LINH on 06/01/2023.
//

import UIKit

protocol ProfileTabsCollectionReusableViewDelegate: AnyObject{
    func didTapGridButtonTab()
    func didTapTaggedButtonTab()
}

class ProfileTabsCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "ProfileTabsCollectionReusableView"
    public var delegate: ProfileTabsCollectionReusableViewDelegate?
    
    struct Constants {
        static let padding: CGFloat = 4
    }
    
    private let gridButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.tintColor = .systemBlue
        button.setImage(UIImage(named: "grid"), for: .normal)
        return button
    }()
    private let taggedButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.tintColor = .lightGray
        button.setImage(UIImage(named: "tag"), for: .normal)
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(gridButton)
        addSubview(taggedButton)
        backgroundColor = .secondarySystemBackground
        gridButton.addTarget(self,
                             action: #selector(didTapGridButtonTab),
                             for: .touchUpInside)
        taggedButton.addTarget(self,
                               action: #selector(didTapTaggedButtonTab),
                               for: .touchUpInside)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let size = height - (Constants.padding)
        let gridButtonX = ((width/2)-size)/2
        gridButton.frame = CGRect(x: gridButtonX,
                                  y: Constants.padding,
                                  width: size,
                                  height: size)
        taggedButton.frame = CGRect(x: gridButtonX + (width/2),
                                  y: Constants.padding,
                                  width: size,
                                  height: size)

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    @objc private func didTapGridButtonTab() {
        gridButton.tintColor = .white
        taggedButton.tintColor = .lightGray
        delegate?.didTapGridButtonTab()
    }
    
    @objc private func didTapTaggedButtonTab() {
        gridButton.tintColor = .lightGray
        taggedButton.tintColor = .systemBlue
        delegate?.didTapTaggedButtonTab()
    }
}
