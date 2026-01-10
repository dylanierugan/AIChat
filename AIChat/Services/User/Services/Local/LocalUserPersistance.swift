//
//  LocalUserPersistence.swift
//  AIChat
//
//  Created by Dylan Ierugan on 12/18/25.
//

protocol LocalUserPersistence {
    func getCurrentUser() -> UserModel?
    func saveCurrentUser(user: UserModel?) throws
}
