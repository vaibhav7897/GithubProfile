//
//  UserAvatarView.swift
//  GithubProfile
//
//  Created by Vaibhav Gupta on 05/02/25.
//

import SwiftUI

struct UserAvatarView: View {
    @StateObject var viewModel: UserViewModel
    
    struct Constants{
        static let placeholder = "person.fill"
        static let screenWH = CGFloat(120)
        static let scaleEffect = CGFloat(1.5)
    }
    
    var body: some View {
        ZStack{
            AsyncImage(url: URL(string: viewModel.avatarImage)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Image(systemName: Constants.placeholder)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .clipShape(Circle())
            .frame(width: Constants.screenWH)
            
            if viewModel.isLoading{
                ZStack{
                    Circle()
                        .frame(width: Constants.screenWH)
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(Constants.scaleEffect)
                }
            }
        }
    }
}

//#Preview {
//    UserAvatarView(image: "person.fill")
//}
