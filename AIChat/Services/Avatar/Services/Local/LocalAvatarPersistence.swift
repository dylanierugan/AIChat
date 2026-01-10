//
//  LocalAvatarPersistence.swift
//  AIChat
//
//  Created by Dylan Ierugan on 1/10/26.
//

@MainActor
protocol LocalAvatarPersistence {
    func addRecentAvatar(avatar: AvatarModel) throws
    func getRecentAvatars() throws -> [AvatarModel]
}
