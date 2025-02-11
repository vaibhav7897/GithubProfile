//
//  RepoCellView.swift
//  GithubProfile
//
//  Created by Vaibhav Gupta on 05/02/25.
//

import Foundation
import SwiftUI

struct RepoCellView: View {
    var repo: RepoCellViewModel
    
    var body: some View {
        VStack{
            Text(repo.name)
                .font(.subheadline)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(repo.fullName)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.subheadline)
        }
        .modifier(FontSizeBoundaryModifeir())
    }
}
