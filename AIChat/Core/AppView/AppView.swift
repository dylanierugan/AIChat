//
//  AppView.swift
//  AIChat
//
//  Created by Dylan Ierugan on 4/8/25.
//

import SwiftUI

struct AppView: View {
    
    @Environment(AuthManager.self) private var authManager
    @Environment(UserManager.self) private var userManager
    @State var appState: AppState = AppState()
    
    var body: some View {
        AppViewBuilder(
            showTabBar: appState.showTabBar,
            tabbarView: {
                TabBarView()
            }, onboardingView: {
                WelcomeView()
            }
        )
        .environment(appState)
        .task {
            await checkUserStatus()
        }
        .onChange(of: appState.showTabBar) { _, showTabBar in
            if !showTabBar {
                Task {
                    await checkUserStatus()
                }
            }
        }
    }
    
    private func checkUserStatus() async {
        if let user = authManager.auth {
            // User is authenticated
            print("User already authenticated: \(user.uid)")
            
            do {
                try await userManager.logIn(auth: user, isNewUser: false)
            } catch {
                print("Failed to log in to auth for exisiting user: \(error)")
                try? await Task.sleep(for: .seconds(5))
                await checkUserStatus()
            }
            
        } else {
            // User is not authenticated
            
            do {
                let result = try await authManager.signInAnonymously()
                
                print("Sign in anonymous success: \(result.user.uid)")
                
                // Log In
                try await userManager.logIn(auth: result.user, isNewUser: result.isNewUser)
                
            } catch {
                print("Failed to sign in anonymously and log in: \(error)")
                try? await Task.sleep(for: .seconds(5))
                await checkUserStatus()
            }
        }
    }
}

#Preview("Tab Bar") {
    AppView(appState: AppState(showTabBar: true))
}

#Preview("Onbaording") {
    AppView(appState: AppState(showTabBar: false))
}
