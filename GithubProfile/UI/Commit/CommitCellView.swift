//
//  CommitCellView.swift
//  GithubProfile
//
//  Created by Vaibhav Gupta on 06/02/25.
//

import SwiftUI

struct CommitCellView: View {
    var commitVm: CommitCellViewModel
    
    var body: some View {
        VStack(alignment: .leading,spacing: 4){
            Text(commitVm.userName)
                .font(.title2)
            Text(commitVm.email)
                .font(.subheadline)
            Text(commitVm.commitDate.toReadableDate() ?? "")
                .font(.subheadline)
        }
        .modifier(FontSizeBoundaryModifeir())
    }
}
