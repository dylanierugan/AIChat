//
//  AvatarAttributes.swift
//  AIChat
//
//  Created by Dylan Ierugan on 9/12/25.
//

enum CharacterOption: String, CaseIterable, Hashable, Codable {
    case man, woman, alien, dog, cat, elephant
    
    static var `default`: Self {
        .man
    }
    
    var plural: String {
        switch self {
        case .man:
            return "men"
        case .woman:
            return "women"
        case .alien:
            return "aliens"
        case .dog:
            return "dogs"
        case .cat:
            return "cats"
        case .elephant:
            return "elephants"
        }
    }
    
    var startsWithVowel: Bool {
        ["a", "e", "i", "o", "u"].contains(rawValue.lowercased().first!)
    }
}

enum CharacterAction: String, CaseIterable, Hashable {
    case smiling, sitting, eating, drinking, walking, shopping, studying, working, relaxing, crying
    
    static var `default`: Self {
        .smiling
    }
}

enum CharacterLocation: String, CaseIterable, Hashable, Codable {
    case park, mall, museum, beach, forest, city, mountain
    static var `default`: Self {
        .park
    }
}

struct AvatarDescriptionBuilder {
    let characterOption: CharacterOption
    let characterAction: CharacterAction
    let characterLocation: CharacterLocation
    
    init(characterOption: CharacterOption, characterAction: CharacterAction, characterLocation: CharacterLocation) {
        self.characterOption = characterOption
        self.characterAction = characterAction
        self.characterLocation = characterLocation
    }
    
    init (avatar: AvatarModel) {
        self.characterOption = avatar.characterOption ?? .default
        self.characterAction = avatar.characterAction ?? .default
        self.characterLocation = avatar.characterLocation ?? .default
    }
    
    var characterDescription: String {
        _ = characterOption.startsWithVowel ? "An" : "A"
        return "A \(characterOption.rawValue) that is \(characterAction.rawValue) in the \(characterLocation.rawValue)"
    }
}
