//
//  ChatModel.swift
//  AIChat
//
//  Created by Dylan Ierugan on 8/15/25.
//

import Foundation

struct ChatModel: Identifiable {
    let id: String
    let userId: String
    let avatarID: String
    let dateCreated: Date
    let dateModified: Date
    
    static var mock: ChatModel {
        mocks[0]
    }
    
    static var mocks: [ChatModel] {
        [
            ChatModel(
                id: "mock-chat-1",
                userId: "user1",
                avatarID: "avatar1",
                dateCreated: Date().addingTimeInterval(days: -10),
                dateModified: Date().addingTimeInterval(days: -9)
            ),
            ChatModel(
                id: "mock-chat-2",
                userId: "user2",
                avatarID: "avatar2",
                dateCreated: Date().addingTimeInterval(days: -7),
                dateModified: Date().addingTimeInterval(days: -6)
            ),
            ChatModel(
                id: "mock-chat-3",
                userId: "user3",
                avatarID: "avatar3",
                dateCreated: Date().addingTimeInterval(days: -4),
                dateModified: Date().addingTimeInterval(days: -3)
            ),
            ChatModel(
                id: "mock-chat-4",
                userId: "user4",
                avatarID: "avatar4",
                dateCreated: Date().addingTimeInterval(days: -2),
                dateModified: Date().addingTimeInterval(days: -1)
            )
        ]
    }

}
