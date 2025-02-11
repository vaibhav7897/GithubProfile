//
//  UserView.swift
//  GithubProfile
//
//  Created by Vaibhav Gupta on 05/02/25.
//

import SwiftUI

struct UserView: View {
    
    @StateObject var userVM: UserViewModel
    @State var isSearchDisabled = false
    
    @State var enteredText = "" {
        didSet
        {
            isSearchDisabled = enteredText.count <= 3
        }
    }
    
    var body: some View {
        VStack{
            UserAvatarView(viewModel: userVM)
            userDescription(viewModel: userVM)
            
            NavigationLink {
                RepoView(repoViewModel: RepoViewModel(user: userVM.user, networkManager: NetworkManagerImp()))
            } label: {
                Text("Repository")
                    .font(.subheadline)
                    .foregroundStyle(.brown)
                    .padding(.top, 20)
            }

            Spacer()
            HStack{
                userSearchBar(viewModel: userVM)
                SearchButton(action: {
                    guard enteredText.isEmpty == false else {return}
                    userVM.getData(name: enteredText)
                }, isDisabled: $isSearchDisabled)
            }
            .padding(.bottom,20)
        }
        .padding()
        .sheet(isPresented: $userVM.isError, content: {
            ErrorView(message: userVM.showError)
        })
    }
    
    @ViewBuilder
    private func userDescription(viewModel: UserViewModel) -> some View{
        VStack{
            Text(viewModel.username)
                .font(.title)
            Group{
                Text(viewModel.bio)
                Text(viewModel.companyName)
            }
            .font(.footnote)
        }
        .bold()
    }
    
    @ViewBuilder
    private func userSearchBar(viewModel: UserViewModel) -> some View{
        let allowedCharacter = 25
        
        TextField("Enter Name", text: $enteredText)
            .autocorrectionDisabled()
            .keyboardType(.alphabet)
            .textInputAutocapitalization(.never)
            .onReceive(enteredText.publisher.collect(), perform: { inputText in
                let filtervalue = inputText.compactMap{ $0.isWhitespace ? nil : $0}
                if filtervalue.count > allowedCharacter {
                    enteredText = String(filtervalue.prefix(allowedCharacter))
                }else{
                    enteredText = String(filtervalue)
                }
            })
            .onSubmit {
                guard enteredText.isEmpty == false else {return}
                viewModel.getData(name: enteredText)
            }
    }
    
}

//#Preview {
//    UserView(userVM: UserViewModel(networkManager: NetworkManagerImp()))
//}
