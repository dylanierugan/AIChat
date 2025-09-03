//
//  CreateAccountView.swift
//  AIChat
//
//  Created by Dylan Ierugan on 9/3/25.
//

import SwiftUI

struct CreateAccountView: View {
    
    var title: String = "Create Account"
    var subtitle: String = "Don't lose your data! Connect to an SSO provideor to save your account information."
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text(subtitle)
                    .font(.body)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            SignInWithAppleButtonView(
                type: .signIn,
                style: .black,
                cornerRadius: 16)
            .frame(height: 55)
            .anyButton(.pressable) {
                
            }
            
            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.top, 56)
    }
}

#Preview {
    CreateAccountView()
}
