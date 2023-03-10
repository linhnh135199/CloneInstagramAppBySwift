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
    
    private let likeCount: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.text = "7.093"
        label.font = label.font.withSize(14)
        label.textColor = .white
        return label
    }()
    
    private let commentCount: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.text = "678"
        label.font = label.font.withSize(14)
        label.textColor = .white
        return label
    }()
    
    //buttons
    private let cameraButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "camera"), for: .normal)
        return button
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "heart-white"), for: .normal)
        return button
    }()
    
    private let commentButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "comment-white"), for: .normal)
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "share-white"), for: .normal)
        return button
    }()
    
    private let moreButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "more-white"), for: .normal)
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
        contentView.addSubview(cameraButton)
        contentView.addSubview(likeCount)
        contentView.addSubview(commentCount)
        
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
        
        
        //buttons
        moreButton.frame = CGRect(x: width-(size+10),
                                     y: height-(size*2)-10,
                                     width: size-5,
                                     height: size-5)
        
        shareButton.frame = CGRect(x: width-(size+10),
                                 y: height-(size*4),
                                 width: size-5,
                                 height: size-5)
        
        commentButton.frame = CGRect(x: width-(size+10),
                                     y: height-(size*6)-10,
                                     width: size-5,
                                     height: size-5)

        likeButton.frame = CGRect(x: width-(size+10),
                                  y: height-(size*8)-10,
                                  width: size-5,
                                  height: size-5)
        
        cameraButton.frame = CGRect(x: width-(size+10),
                                          y: height-(size*22),
                                          width: size-5,
                                          height: size-5)
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
                                     y: height-105,
                                     width: width-size-10,
                                     height: 50)
        likeCount.frame = CGRect(x: width-(size+26),
                                 y: likeButton.bottom-10,
                                  width: 50,
                                  height: 50)
        commentCount.frame = CGRect(x: width-(size+32),
                                    y: commentButton.bottom-8,
                                     width: 50,
                                     height: 50)
        //image avt
        profilePhotoImageView.frame = CGRect(x: 10,
                                             y: height - 100,
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
