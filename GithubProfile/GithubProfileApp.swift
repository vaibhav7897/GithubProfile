//
//  GithubProfileApp.swift
//  GithubProfile
//
//  Created by Vaibhav Gupta on 05/02/25.
//

import SwiftUI

@main
struct GithubProfileApp: App {
    private let networkManager: NetworkManager = NetworkManagerImp()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                UserView(userVM: UserViewModel(networkManager: NetworkManagerImp()))
            }
        }
    }
}
