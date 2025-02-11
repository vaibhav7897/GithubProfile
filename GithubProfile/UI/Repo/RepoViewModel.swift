//
//  RepoViewModel.swift
//  GithubProfile
//
//  Created by Vaibhav Gupta on 05/02/25.
//

import Foundation

class RepoViewModel: ObservableObject{
    @Published var repo = [Repository]()
    @Published var isLoading = false
    @Published var isError = false
    @Published var showError = ""
    
    var netWorkManager: NetworkManager
    private var user = User()
    
    init(user: User, networkManager: NetworkManager){
        self.netWorkManager = networkManager
        self.user = user
        getRepo()
    }
    var userName: String {user.login}
    
    func getRepo(){
        isLoading = true
        Task{
            do{
                let repo = try await netWorkManager.getRepo(forName: user.login)
                DispatchQueue.main.asyncAfter(deadline: .now()+0.2){
                    self.isLoading = false
                    self.repo = repo
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
