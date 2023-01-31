//
//  VideoCollectionViewCell.swift
//  CloneInstagramApp
//
//  Created by HOANG LINH on 30/01/2023.
//

import UIKit
import AVFoundation

protocol VideoCollectionViewCellDelegate: AnyObject {
    
    func didTapLikeButton(with model: VideoModel)
    
    func didTapCommentButton(with model: VideoModel)
    
    func didTapProfileButton(with model: VideoModel)
    
    func didTapShareButton(with model: VideoModel)
    
    func didTapMoreButton(with model: VideoModel)
}

class VideoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "VideoCollectionViewCell"
    //image
    
    private let profilePhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "avt")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    private let profileAudio: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "avt")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    //labels
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 17.0)
        label.textColor = .white
        return label
    }()
    
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    private let audioLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    //buttons
    
    private let profileButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "avt"), for: .normal)
        button.backgroundColor = .white
        return button
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "heart"), for: .normal)
        button.backgroundColor = .white
        return button
    }()
    
    private let commentButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setBackgroundImage(UIImage(named: "comment"), for: .normal)
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setBackgroundImage(UIImage(named: "share"), for: .normal)
        return button
    }()
    
    private let moreButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setBackgroundImage(UIImage(named: "more"), for: .normal)
        return button
    }()
    
    //delegate
    weak var delegate: VideoCollectionViewCellDelegate?
    
    private func addSubviews(){
        contentView.addSubview(videoContainer)
        
        contentView.addSubview(profilePhotoImageView)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(captionLabel)
        contentView.addSubview(audioLabel)
        contentView.addSubview(profileAudio)
        contentView.addSubview(likeButton)
        contentView.addSubview(commentButton)
        contentView.addSubview(shareButton)
        contentView.addSubview(moreButton)
        
        likeButton.addTarget(self,
                             action: #selector(didTapLikeButton),
                             for: .touchUpInside)
        commentButton.addTarget(self,
                                action: #selector(didTapCommentButton),
                                for: .touchUpInside)
        shareButton.addTarget(self,
                              action: #selector(didTapShareButton),
                              for: .touchUpInside)
        moreButton.addTarget(self,
                             action: #selector(didTapMoreButton),
                             for: .touchUpInside)
        
        likeButton.imageView?.tintColor = .white
        
        videoContainer.clipsToBounds = true
        contentView.sendSubviewToBack(videoContainer)
    }
    
    private let videoContainer = UIView()
    
    var player: AVPlayer?
    private var model: VideoModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .black
        contentView.clipsToBounds = true
        addSubviews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        videoContainer.frame = contentView.bounds
        //buttons
        let size = contentView.frame.size.width/12
        let width = contentView.frame.size.width
        let height = contentView.frame.size.height - 100
        
        profileAudio.frame = CGRect(x: width-(size+10),
                                   y: height-(size*5)+150,
                                   width: (size+8)-10,
                                   height: (size+8)-10)
        profileAudio.layer.cornerRadius = size/3
        
        moreButton.frame = CGRect(x: width-(size+10),
                                     y: height-(size*7)-10,
                                     width: size,
                                     height: size)
        
        shareButton.frame = CGRect(x: width-(size+10),
                                 y: height-(size*9)-10,
                                 width: size,
                                 height: size)
        
        commentButton.frame = CGRect(x: width-(size+10),
                                     y: height-(size*11)-10,
                                     width: size,
                                     height: size)
        
        likeButton.frame = CGRect(x: width-(size+10),
                                  y: height-(size*13)-10,
                                  width: size,
                                  height: size)
        
        //labes
        audioLabel.frame = CGRect(x: 10,
                                  y: height-40,
                                  width: width-size-10,
                                  height: 50)
        captionLabel.frame = CGRect(x: 10,
                                    y: height-70,
                                    width: width-size-10,
                                    height: 50)
        usernameLabel.frame = CGRect(x: profilePhotoImageView.right+10,
                                     y: height-115,
                                     width: width-size-10,
                                     height: 50)
        
        profilePhotoImageView.frame = CGRect(x: 10,
                                             y: height - 110,
                                             width: size,
                                             height: size)
        profilePhotoImageView.layer.cornerRadius = size/2
        
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model: VideoModel){
        self.model = model
        configureVideo()

        //labels
        captionLabel.text = model.caption
        audioLabel.text = model.audioTrackName
        usernameLabel.text = model.username
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        captionLabel.text = nil
        audioLabel.text = nil
        usernameLabel.text = nil
    }
    
    private func configureVideo() {
        guard let model = model else { return }
        guard let path = Bundle.main.path(forResource: model.videoFileName,
                                          ofType: model.videoFileFormat) else {
            print("Fail")
            return
        }
        player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerView = AVPlayerLayer()
        playerView.player = player
        playerView.frame = contentView.bounds
        playerView.videoGravity = .resizeAspectFill
        videoContainer.layer.addSublayer(playerView)
        player?.volume = 0
        player?.play()
    }
    
    @objc private func didTapLikeButton(){
        guard let model = model else { return }
        delegate?.didTapLikeButton(with: model)
    }
    
    @objc private func didTapCommentButton(){
        guard let model = model else { return }
        delegate?.didTapCommentButton(with: model)
    }
    
    @objc private func didTapShareButton(){
        guard let model = model else { return }
        delegate?.didTapShareButton(with: model)
    }
    
    @objc private func didTapProfileButton(){
        guard let model = model else { return }
        delegate?.didTapProfileButton(with: model)
    }
    
    @objc private func didTapMoreButton(){
        guard let model = model else{ return }
        delegate?.didTapMoreButton(with: model)
    }
}
