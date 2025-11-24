//
//  CreateAccountView.swift
//  AIChat
//
//  Created by Dylan Ierugan on 9/3/25.
//

import SwiftUI

struct CreateAccountView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.authService) private var authService
    var title: String = "Create Account"
    var subtitle: String = "Don't lose your data! Connect to an SSO provideor to save your account information."
    var onDidSignIn: ((_ isNewUser: Bool) -> Void)?
    
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
                onSignInApplePressed()
            }
            
            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.top, 56)
    }
    
    func onSignInApplePressed() {
        Task {
            do {
                let result = try await authService.signInApple()
                onDidSignIn?(result.isNewUser)
                dismiss()
                print("Error")
            } catch {
                print("Failed to sign in with Apple: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    CreateAccountView()
}
