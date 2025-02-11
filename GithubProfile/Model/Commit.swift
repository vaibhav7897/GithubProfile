//
//  Commit.swift
//  GithubProfile
//
//  Created by Vaibhav Gupta on 05/02/25.
//

import Foundation

struct Commit: Decodable, Identifiable {
    var id: String { return sha }
    
    let sha: String
    let nodeId: String
    let commit: CommitDetail
}

struct CommitDetail: Decodable {
    let author: CommitAuthor
}

struct CommitAuthor: Decodable {
    let name: String
    let email: String
    let date: String
}
