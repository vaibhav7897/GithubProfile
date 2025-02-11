//
//  User.swift
//  GithubProfile
//
//  Created by Vaibhav Gupta on 05/02/25.
//

import Foundation

struct User: Codable{
    let login: String
    let avatarUrl: String?
    let bio: String?
    let company: String?
}
extension User{
    init(){
        self.login = ""
        self.avatarUrl = ""
        self.bio = ""
        self.company = ""    }
}
