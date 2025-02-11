//
//  CommitView.swift
//  GithubProfile
//
//  Created by Vaibhav Gupta on 06/02/25.
//

import SwiftUI

struct CommitView: View {
    @StateObject var commitVm: CommitViewModel
    
    var body: some View {
        List(commitVm.commits){ commit in
            CommitCellView(commitVm: CommitCellViewModelImp.create(from: commit))
        }
    }
}

