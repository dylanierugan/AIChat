//
//  MockLocalAvatarPersistance.swift
//  AIChat
//
//  Created by Dylan Ierugan on 1/10/26.
//

@MainActor
struct MockLocalAvatarPersistance: LocalAvatarPersistance {
    
    func addRecentAvatar(avatar: AvatarModel) throws {
        
    }
    
    func getRecentAvatars() throws -> [AvatarModel] {
        AvatarModel.mocks.shuffled()
    }
}
