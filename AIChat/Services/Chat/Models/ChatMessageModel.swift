//
//  ChatMessageModel.swift
//  AIChat
//
//  Created by Dylan Ierugan on 8/15/25.
//

import Foundation

struct ChatMessageModel {
    let id: String
    let chatId: String
    let authorId: String?
    let content: String?
    let seenByIds: [String]?
    let dateCreated: Date?
    
    init(
        id: String,
        chatId: String,
        authorId: String? = nil,
        content: String? = nil,
        seenByIds: [String]? = nil,
        dateCreated: Date? = nil
    ) {
        self.id = id
        self.chatId = chatId
        self.authorId = authorId
        self.content = content
        self.seenByIds = seenByIds
        self.dateCreated = dateCreated
    }
    
    func hasBeenSeenBy(userId: String) -> Bool {
        guard let seenByIds else {
            return false
        }
        return seenByIds.contains(userId)
    }
    
    static var mock: ChatMessageModel {
        mocks[0]
    }
    
    static var mocks: [ChatMessageModel] {
        [
            ChatMessageModel(
                id: UUID().uuidString,
                chatId: "chat1",
                authorId: "user1",
                content: "Hey, how’s it going?",
                seenByIds: ["user2", "user3"],
                dateCreated: Date().addingTimeInterval(days: -10, hours: -2)
            ),
            ChatMessageModel(
                id: UUID().uuidString,
                chatId: "chat1",
                authorId: "user2",
                content: "Pretty good! You?",
                seenByIds: ["user1", "user3"],
                dateCreated: Date().addingTimeInterval(days: -10, hours: -1, minutes: -30)
            ),
            ChatMessageModel(
                id: UUID().uuidString,
                chatId: "chat2",
                authorId: "user3",
                content: "Anyone up for lunch?",
                seenByIds: ["user4"],
                dateCreated: Date().addingTimeInterval(days: -5, hours: -3)
            ),
            ChatMessageModel(
                id: UUID().uuidString,
                chatId: "chat2",
                authorId: "user4",
                content: "Sure, let’s go at noon.",
                seenByIds: ["user3"],
                dateCreated: Date().addingTimeInterval(days: -5, hours: -2, minutes: -15)
            )
        ]
    }

}
