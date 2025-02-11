//
//  SearchButton.swift
//  GithubProfile
//
//  Created by Vaibhav Gupta on 05/02/25.
//

import Foundation
import SwiftUI

struct SearchButton: View{
    var action: (() -> Void)
    
    @State private var scale = CGFloat(1)
    @Binding var isDisabled: Bool
    
    var body: some View{
        
        Button{
            withAnimation(.spring(.bouncy, blendDuration: 0.3)){
                scale += 0.2
                resetScale()
            } 
        }label: {
            Image(systemName: "magnifyingglass")
        }
        .disabled(isDisabled)
        .scaleEffect(scale)
        
    }
    private func resetScale(){
        DispatchQueue.main.asyncAfter(deadline: .now()+0.2){
            withAnimation{
                scale = 1
                action()
            }
        }
    }
}
