//
//  Repository.swift
//  GithubProfile
//
//  Created by Vaibhav Gupta on 05/02/25.
//

import Foundation

struct Repository: Codable, Identifiable{
    let id: Int
    let name: String
    let fullName: String
}
extension Repository{
    init(){
        self.id = 0
        self.name = ""
        self.fullName = ""
    }
}
