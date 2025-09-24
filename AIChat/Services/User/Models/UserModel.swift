//
//  UserModel.swift
//  AIChat
//
//  Created by Dylan Ierugan on 8/21/25.
//

import Foundation
import SwiftUI

struct UserModel {
    
    let userID: String
    let dateCreated: Date?
    let didCompleteOnboarding: Bool?
    let profileColorHEX: String?
    
    init(
        userID: String,
        dateCreated: Date? = nil,
        didCompleteOnboarding: Bool? = nil,
        profileColorHEX: String? = nil
    ) {
        self.userID = userID
        self.dateCreated = dateCreated
        self.didCompleteOnboarding = didCompleteOnboarding
        self.profileColorHEX = profileColorHEX
    }
    
    var profileColorCalculated: Color {
        guard let profileColorHEX else {
            return .accent
        }
        
        return Color(hex: profileColorHEX)
    }
    
    static var mock: Self {
        mocks[0]
    }
    
    static var mocks: [Self] {
        let now = Date()
        return [
            .init(
                userID: "user1",
                dateCreated: Calendar.current.date(byAdding: .day, value: -30, to: now),
                didCompleteOnboarding: true,
                profileColorHEX: "#FFD93D"
            ),
            .init(
                userID: "u_002",
                dateCreated: Calendar.current.date(byAdding: .day, value: -14, to: now),
                didCompleteOnboarding: false,
                profileColorHEX: "#4ECDC4"
            ),
            .init(
                userID: "u_003",
                dateCreated: Calendar.current.date(byAdding: .day, value: -3, to: now),
                didCompleteOnboarding: nil,
                profileColorHEX: "#FF6B6B"
            ),
            .init(
                userID: "u_004",
                dateCreated: nil,
                didCompleteOnboarding: true,
                profileColorHEX: nil
            )
        ]
    }
}
