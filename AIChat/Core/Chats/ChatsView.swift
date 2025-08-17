//
//  ChatsView.swift
//  AIChat
//
//  Created by Dylan Ierugan on 4/11/25.
//

import SwiftUI

struct ChatsView: View {
    
    @State private var chats: [ChatModel] = ChatModel.mocks
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(chats) { chat in
                    ChatRowCellViewBuilder(
                        currentUserId: nil, // Add CUID
                        chat: chat,
                        getAvatar: {
                            try? await Task.sleep(for: .seconds(1))
                            return .mock
                        },
                        getLastChatMessage: {
                            try? await Task.sleep(for: .seconds(5))
                            return .mock
                        }
                    )
                    .removeListRowFormatting()
                }
            }
            .anyButton(.highlight) {
                
            }
            .navigationTitle("Chats")
        }
    }
}

#Preview {
    ChatsView()
}
