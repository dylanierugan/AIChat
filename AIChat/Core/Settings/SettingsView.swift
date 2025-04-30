//
//  SettingsView.swift
//  AIChat
//
//  Created by Dylan Ierugan on 4/17/25.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(AppState.self) private var appState
    
    var body: some View {
        NavigationStack {
            List {
                Button {
                    onSignOutTapped()
                } label: {
                    Text("Sign Out")
                }
            }
            .navigationTitle(Text("Settings"))
        }
    }
    
    func onSignOutTapped() {
        dismiss()
        
        Task {
            try? await Task.sleep(for: .seconds(1))
            appState.updateViewState(showTabBarView: false)
        }
    }
}

#Preview {
    SettingsView()
        .environment(AppState())
}
