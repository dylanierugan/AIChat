//
//  AppView.swift
//  AIChat
//
//  Created by Dylan Ierugan on 4/8/25.
//

import SwiftUI

struct AppView: View {
    
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
    }
}

#Preview("Tab Bar") {
    AppView(appState: AppState(showTabBar: true))
}

#Preview("Onbaording") {
    AppView(appState: AppState(showTabBar: false))
}
