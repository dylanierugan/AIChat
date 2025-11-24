//
//  AppView.swift
//  AIChat
//
//  Created by Dylan Ierugan on 4/8/25.
//

import SwiftUI

struct AppView: View {
    
    @Environment(\.authService) private var authService
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
        if let user = authService.getAuthenticatedUser() {
            // User is authenticated
            print("User already authenticated: \(user.uid)")
        } else {
            // User is not authenticated
            
            do {
                let reuslt = try await authService.signInAnonymously()
                
                print("Sign in anonymous success: \(reuslt.user.uid)")
            } catch {
                
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
