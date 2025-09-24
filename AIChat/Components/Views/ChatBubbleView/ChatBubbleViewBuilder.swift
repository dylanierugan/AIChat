//
//  ChatBubbleViewBuilder.swift
//  AIChat
//
//  Created by Dylan Ierugan on 9/24/25.
//

import SwiftUI

struct ChatBubbleViewBuilder: View {
    
    var message: ChatMessageModel = .mock
    var isCurrentUser: Bool = false
    var imageName: String?
    
    var body: some View {
        ChatBubbleView(
            text: message.content ?? "",
            textColor: isCurrentUser ? .white : .primary,
            backgroundColor: isCurrentUser ? .accent : Color(uiColor: .systemGray6),
            showImage: !isCurrentUser,
            imageName: imageName
        )
        .frame(maxWidth: .infinity, alignment: isCurrentUser ? .trailing : .leading)
        .padding(.leading, isCurrentUser ? 75 : 0)
        .padding(.trailing, isCurrentUser ? 0 : 75)
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 24) {
            ChatBubbleViewBuilder()
            
            ChatBubbleViewBuilder(isCurrentUser: true)
            
            ChatBubbleViewBuilder(
                message: ChatMessageModel(
                    id: UUID().uuidString,
                    chatId: UUID().uuidString,
                    content: "This is a chat bubble with a lot of lines and a lot of text. This is a chat bubble with a lot of lines and a lot of text.",
                )
            )
            
            ChatBubbleViewBuilder(
                message: ChatMessageModel(
                    id: UUID().uuidString,
                    chatId: UUID().uuidString,
                    content: "This is a chat bubble with a lot of lines and a lot of text. This is a chat bubble with a lot of lines and a lot of text.",
                ),
                isCurrentUser: true
            )
        }
        .padding(12)
    }
}
