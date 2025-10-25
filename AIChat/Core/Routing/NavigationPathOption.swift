//
//  NavigationPathOption.swift
//  AIChat
//
//  Created by Dylan Ierugan on 10/25/25.
//

import SwiftUI
import Foundation

enum NavigationPathOption: Hashable {
    case chat(avatarId: String)
    case category(categroy: CharacterOption, imageName: String)
}

extension View {
    
    func navigationDestinationForCoreModule(path: Binding<[NavigationPathOption]>) -> some View {
        self
            .navigationDestination(for: NavigationPathOption.self) { newValue in
                switch newValue {
                case .chat(avatarId: let avatarId):
                    ChatView(avatarId: avatarId)
                case .category(categroy: let category, imageName: let imageName):
                    CategoryListView(path: path, category: category, imageName: imageName)
                }
            }
    }
}
