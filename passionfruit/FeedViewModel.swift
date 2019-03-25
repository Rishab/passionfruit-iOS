//
//  FeedViewModel.swift
//  passionfruit
//
//  Created by Rishab Chawla on 3/12/19.
//  Copyright © 2019 Rishab Chawla. All rights reserved.
//

import Foundation

struct User: Codable {
    let name: String
    let userid: Int
    let profileInfo: ProfileInfo
    let authToken: String
    let socialMedia: SocialMedia
}

struct ProfileInfo: Codable {
    let age: Int
    let gender: String
}

struct SocialMedia: Codable {
    let facebook: String
}

struct FeedData: Codable {
    let count: Int
    let users: [User]
}
