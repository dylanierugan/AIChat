//
//  WelcomeView.swift
//  AIChat
//
//  Created by Dylan Ierugan on 4/13/25.
//

import SwiftUI

struct WelcomeView: View {
    
    @Environment(AppState.self) private var root
    
    @State private var imageName: String = Constants.randomImage
    @State private var showSignInView: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                ImageLoaderView(urlString: imageName)
                    .ignoresSafeArea()
                
                titleSection
                    .padding(.top, 24)
                
                CTAButtons
                    .padding(16)
                
                policyLinks
            }
            .sheet(isPresented: $showSignInView) {
                CreateAccountView(title: "Sign in",
                                  subtitle: "Connect to an existing account.",
                                  onDidSignIn: { isNewUser in
                    handleDidSignIn(isNewUser: isNewUser)
                }
                                  
                )
                .presentationDetents([.medium])
            }
        }
    }
    
    private var titleSection: some View {
        VStack(spacing: 8) {
            Text("AI Chat")
                .font(.largeTitle)
                .bold()
            Text("Dylan Ierugan")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
    
    private var CTAButtons: some View {
        VStack(spacing: 8) {
            NavigationLink {
                OnboardingIntroView()
            } label: {
                Text("Get Started")
                    .callToActionButton()
            }
            Text("Already have an account? Sign In")
                .underline()
                .font(.body)
                .padding(8)
                .tappableBackground()
                .onTapGesture {
                    onSignInTapped()
                }
        }
        .padding(16)
    }
    
    private func handleDidSignIn(isNewUser: Bool) {
        if isNewUser {
            
        } else {
            root.updateViewState(showTabBarView: true)
        }
    }
    
    private func onSignInTapped() {
        showSignInView = true
    }
    
    private var policyLinks: some View {
        HStack(spacing: 8) {
            Link(destination: URL(string: Constants.privacyPolicyUrl)!) {
                Text("Priacy Policy")
            }
            Circle()
                .fill(.accent)
                .frame(width: 4, height: 4)
            Link(destination: URL(string: Constants.termsOfServiceURL)!) {
                Text("Terms of Service")
            }
        }
    }
}

#Preview {
    WelcomeView()
}
