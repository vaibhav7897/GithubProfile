//
//  ViewModifiers.swift
//  GithubProfile
//
//  Created by Vaibhav Gupta on 05/02/25.
//

import Foundation
import SwiftUI

struct FontSizeBoundaryModifeir: ViewModifier{
    func body(content: Content) -> some View {
        content
            .dynamicTypeSize(.medium ... .xxLarge)
    }
    
}


struct DismissKeyboardOnTap : ViewModifier{
    
    func body(content: Content) -> some View{
        content
            .onTapGesture {
                hideKeyboard()
            }
    }
    
    private func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: .none)
    }
}
