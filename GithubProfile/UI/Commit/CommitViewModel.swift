//
//  CommitViewModel.swift
//  GithubProfile
//
//  Created by Vaibhav Gupta on 06/02/25.
//

import Foundation

class CommitViewModel: ObservableObject{
    
    @Published var commits : [Commit] = []
    @Published var isLoading = false
    @Published var isError = false
    @Published var showError = ""
    
    var networkManager: NetworkManager
    var user: String
    var repo: String
    
    init(networkManager: NetworkManager, user: String, repo: String) {
        self.networkManager = networkManager
        self.user = user
        self.repo = repo
        getRepo()
    }
    
    func getRepo(){
        isLoading = true
        Task{
            do{
                let commits = try await networkManager.getCommit(forUser: user, forRepo: repo)
                DispatchQueue.main.asyncAfter(deadline: .now()+0.2){
                    self.isLoading = false
                    self.commits = commits
                }
            }catch(let error){
                handleError(error: error)
            }
        }
    }
    private func handleError(error: Error){
        let message: String
        
        if let networkError = error as? ApiError{
            switch networkError{
            
            case .invalidUrl:
                message = "Invalid Url"
            case .invalidResponse:
                message = "Inavalid response"
            case .invalidData:
                message = "Invlaid Data"
            }
        }else{
            message = "Error Undefined"
        }
        DispatchQueue.main.async {
            self.showError = message
            self.isError = true
            self.isLoading = false
        }
    }
}
