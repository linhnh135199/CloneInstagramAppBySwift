//
//  Models.swift
//  CloneInstagramApp
//
//  Created by HOANG LINH on 06/01/2023.
//

import Foundation
enum Gender {
    case male,female,other
}
struct UserCount {
    let followers: Int
    let following: Int
    let posts: Int
}

struct User {
    let username: String
    let bio: String
    let name: (first: String,last: String)
    let profilePhoto: URL
    let birthDate: Date
    let gender: Gender
    let counts: UserCount
    let joinDate: Date
}

public enum UserPostType: String {
    case photo = "Photo"
    case video = "Video"
}
public struct UserPost {
    let identifier: String
    let postType: UserPostType
    let thumbnailImage: URL
    let postURL: URL
    let caption: String?
    let likeCount: [PostLikes]
    let comments : [PostComment]
    let createDate: Date
    let taggedUser: [String]
    let owner: User
}
struct PostLikes{
    let username: String
    let pistIdentifier: String
}
struct CommentLike {
    let username: String
    let commentIdentifier: String
}
struct PostComment {
    let identifier: String
    let username: String
    let text: String
    let createdDate: Date
    let likes: [CommentLike]
}

