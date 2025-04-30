//
//  ProfileView.swift
//  AIChat
//
//  Created by Dylan Ierugan on 4/11/25.
//

import SwiftUI

struct ProfileView: View {
    
    @State var showSettingsView: Bool = false
    
    var body: some View {
        NavigationStack {
            Text("Profile")
                .navigationTitle("Profile")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        settingsButton
                    }
                }
        }
        .sheet(isPresented: $showSettingsView) {
            SettingsView()
        }
    }
    
    private var settingsButton: some View {
        Button {
            onSettingButtonPressed()
        } label: {
            Image(systemName: "gear")
                .font(.headline)
        }
    }
    
    private func onSettingButtonPressed() {
        showSettingsView = true
    }
}

#Preview {
    ProfileView()
}
