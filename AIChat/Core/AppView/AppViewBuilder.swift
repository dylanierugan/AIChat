//
//  AppViewBuilder.swift
//  AIChat
//
//  Created by Dylan Ierugan on 4/8/25.
//

import SwiftUI

struct AppViewBuilder<TabbarView: View, OnboardingView: View>: View {
    
    var showTabBar: Bool = false
    @ViewBuilder var tabbarView: TabbarView
    @ViewBuilder var onboardingView: OnboardingView
    
    var body: some View {
        ZStack {
            if showTabBar {
                tabbarView
                    .transition(.move(edge: .trailing))
            } else {
                onboardingView
                    .transition(.move(edge: .leading))
            }
        }
        .animation(.smooth, value: showTabBar)
    }
}

private struct PreviewView: View {
    
    @State private var showTabBar: Bool = false
    
    var body: some View {
        AppViewBuilder(showTabBar: showTabBar,
                       tabbarView: {
            ZStack {
                Color.red.ignoresSafeArea()
                Text("Tab Bar")
            }
            .transition(.move(edge: .trailing))
        }, onboardingView: {
            ZStack {
                Color.blue.ignoresSafeArea()
                Text("Onboaring")
            }
            .transition(.move(edge: .leading))
        })
        .onTapGesture {
            showTabBar.toggle()
        }
    }
}

#Preview {
    PreviewView()
}
