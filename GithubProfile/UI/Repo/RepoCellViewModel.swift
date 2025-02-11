//
//  RepoCellViewModel.swift
//  GithubProfile
//
//  Created by Vaibhav Gupta on 05/02/25.
//

import Foundation
protocol RepoCellViewModel{
    var name: String {get}
    var fullName: String {get}
}

struct RepoCellViewModelImp : RepoCellViewModel{
    
    var name: String {repo.name}
    var fullName: String {repo.fullName}
    
    private var repo: Repository
    
    init(repo: Repository){
        self.repo = repo
    }
}
