//
//  OnboardingCompletedView.swift
//  AIChat
//
//  Created by Dylan Ierugan on 4/14/25.
//

import SwiftUI

struct OnboardingCompletedView: View {
    
    @State private var isCompletingProfileSetup: Bool = false
    @Environment(AppState.self) private var root
    
    var selectedColor: Color = .orange
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Set up Complete!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(selectedColor)
            
            Text("We've set up your profile and you're ready to start chatting.")
                .font(.title)
                .fontWeight(.medium)
                .foregroundStyle(.secondary)
            
        }
        .frame(maxHeight: .infinity)
        .safeAreaInset(edge: .bottom, content: {
            AsyncCallToActionButton(
                isLoading: isCompletingProfileSetup,
                title: "Finish") {
                    onFinishButtonTapped()
                }
        })
        .padding(24)
        .toolbar(.hidden, for: .navigationBar)
    }
    
    func onFinishButtonTapped() {
        isCompletingProfileSetup = true
        Task {
            try await Task.sleep(for: .seconds(3))
            isCompletingProfileSetup = false
            // try await saveUserProfile(color: selectedColor)
        }
        root.updateViewState(showTabBarView: true)
    }
}

#Preview {
    OnboardingCompletedView(selectedColor: .mint)
        .environment(AppState())
}
