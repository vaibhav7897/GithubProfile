//
//  RepoView.swift
//  GithubProfile
//
//  Created by Vaibhav Gupta on 05/02/25.
//

import SwiftUI

struct RepoView: View {
    @StateObject var repoViewModel: RepoViewModel
    
    var body: some View {
        List(repoViewModel.repo) {repo in
            NavigationLink {
                CommitView(commitVm: CommitViewModel(networkManager: repoViewModel.netWorkManager, user: repoViewModel.userName, repo: repo.name))
            } label: {
                RepoCellView(repo: RepoCellViewModelImp(repo: repo))
            }

            
        }
    }
}

//#Preview {
//    RepoView()
//}
