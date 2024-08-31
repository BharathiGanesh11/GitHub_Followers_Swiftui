//
//  User.swift
//  Github Followers Swiftui
//
//  Created by Kumar on 31/08/24.
//

import Foundation

struct User : Codable
{
    var login: String
    var avatarUrl: String
    var name : String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var htmlUrl : String
    var following: Int
    var followers: Int
    var createdAt : String
}
