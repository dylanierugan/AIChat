//
//  TextValidationHelper.swift
//  AIChat
//
//  Created by Dylan Ierugan on 10/4/25.
//

import Foundation

struct TextValidationHelper {
    
    static func checkIfTextIsValid(text: String) throws {
        let minCharacterCount = 4
        guard text.count >= minCharacterCount else {
            throw TextValidationError.notEnoughCharacters(min: minCharacterCount)
        }
        
        let badWords: [String] = ["bitch", "ass", "shit"]
        if badWords.contains(text.lowercased()) {
            throw TextValidationError.hasBadWords
        }
    }
    
    enum TextValidationError: LocalizedError {
        case notEnoughCharacters(min: Int)
        case hasBadWords
        
        var errorDescription: String? {
            switch self {
            case .notEnoughCharacters(min: let min):
                return "Please add at least \(min) characters."
            case .hasBadWords:
                return "Bad word detected. Please rephrase your message."
            }
        }
    }
    
}
