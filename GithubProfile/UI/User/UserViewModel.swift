//
//  UserViewModel.swift
//  GithubProfile
//
//  Created by Vaibhav Gupta on 05/02/25.
//

import Foundation

class UserViewModel: ObservableObject{
    @Published var user = User()
    @Published var isLoading = false
    @Published var isError = false
    @Published var showError = ""
    
    let networkNamager: NetworkManager
    let navigationTitle: String = "Github User"
    
    var username: String {user.login}
    var avatarImage: String{ user.avatarUrl ?? ""}
    var bio: String {user.bio ?? "NoBio"}
    var companyName: String {user.company ?? "No Company"}
    
    init(networkManager: NetworkManager){
        self.networkNamager = networkManager
    }
    
    func getData(name: String){
        isLoading = true
        Task{
            do{
                let userData = try await networkNamager.getUser(forName: name)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.isLoading = false
                    self.user = userData
                }
            }catch{
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
