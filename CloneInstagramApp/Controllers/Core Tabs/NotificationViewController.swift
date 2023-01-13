//
//  NotificationViewController.swift
//  CloneInstagramApp
//
//  Created by HOANG LINH on 03/01/2023.
//

import UIKit
enum UserNotificationType{
    case like(post: UserPost)
    case follow(state: FollowState)
}
struct UserNotification {
    let type: UserNotificationType
    let text: String
    let user: User
}

final class NotificationViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.isHidden = false
        tableView.register(NotificationLikeEventTableViewCell.self,
                           forCellReuseIdentifier: NotificationLikeEventTableViewCell.identifier)
        tableView.register(NotificationFollowEventTableViewCell.self,
                           forCellReuseIdentifier: NotificationFollowEventTableViewCell.identifier)

        return tableView
    }()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.tintColor = .label
        return spinner
    }()
    
    private lazy var noNotificationsView = NoNofiticationsView()
    
    private var models = [UserNotification]()
    //lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchNotification()
        navigationItem.title = "Notifications"
        view.backgroundColor = .systemBackground
        view.addSubview(spinner)
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        spinner.frame = CGRect(x: 0,
                               y: 0,
                               width: 100,
                               height: 100)
        spinner.center = view.center
    }
    
    private func fetchNotification(){
        for x in 0...100 {
            let post = UserPost(identifier: "",
                                postType: .photo,
                                thumbnailImage: URL(string: "https://www.youtube.com")!,
                                postURL: URL(string: "https://www.youtube.com")!,
                                caption: nil,
                                likeCount: [],
                                comments: [],
                                createDate: Date(),
                                taggedUser: [])
            let model = UserNotification(type: x % 2 == 0 ? .like(post: post): .follow(state: .no_following),
                                         text: "Hello Linh!!!",
                                         user: User(username: "Linh",
                                                    bio: "",
                                                    name: (first: "", last: ""),
                                                    profilePhoto: URL(string: "https://www.youtube.com")!,
                                                    birthDate: Date(),
                                                    gender: .male,
                                                    counts: UserCount(followers: 1, following: 1, posts: 1),
                                                    joinDate: Date()))
            models.append(model)
        }
    }
    
    private func addNoNotificationView(){
        tableView.isHidden = true
        view.addSubview(tableView)
        noNotificationsView.frame = CGRect(x: 0,
                                           y: 0,
                                           width: view.width/2,
                                           height: view.width/4)
        noNotificationsView.center = view.center
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        switch model.type{
        case .like(_):
            //cell like
            let cell = tableView.dequeueReusableCell(withIdentifier: NotificationLikeEventTableViewCell.identifier,
                                                     for: indexPath) as! NotificationLikeEventTableViewCell
            cell.configure(with: model)
            cell.delegate = self
            return cell
        case .follow:
            //cell follow
            let cell = tableView.dequeueReusableCell(withIdentifier: NotificationFollowEventTableViewCell.identifier,
                                                     for: indexPath) as! NotificationFollowEventTableViewCell
            //cell.configure(with: model)
            cell.delegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52
    }
}
extension NotificationViewController: NotificationLikeEventTableViewCellDelegate {
    func didTapRelatedPostButton(model: UserNotification) {
        print("Tapped Post")
        //open the post
    }
}

extension NotificationViewController: NotificationFollowEventTableViewCellDelegate {
    func didTapFollowUnfollowButton(model: UserNotification) {
        print("tapped post")
        //perform database update
        
    }
}
