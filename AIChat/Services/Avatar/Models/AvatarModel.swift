//
//  AvatarModel.swift
//  AIChat
//
//  Created by Dylan Ierugan on 5/4/25.
//

import Foundation

struct AvatarModel: Hashable {
    
    let avatarid: String
    let name: String?
    let characterOption: CharacterOtion?
    let characterAction: CharacterAction?
    let characterLocation: CharacterLocation?
    let profileImageName: String?
    let authorId: String?
    let datecreated: Date?
    
    init(
        avatarid: String,
        name: String? = nil,
        characterOption: CharacterOtion? = nil,
        characterAction: CharacterAction? = nil,
        characterLocation: CharacterLocation? = nil,
        profileImageName: String? = nil,
        authorId: String? = nil,
        datecreated: Date? = nil
    ) {
        self.avatarid = avatarid
        self.name = name
        self.characterOption = characterOption
        self.characterAction = characterAction
        self.characterLocation = characterLocation
        self.profileImageName = profileImageName
        self.authorId = authorId
        self.datecreated = datecreated
    }
    
    var characterDescription: String {
        AvatarDescriptionBuilder(avatar: self).characterDescription
    }
    
    static var mock : AvatarModel {
        mocks[0]
    }
    
    static var mocks : [AvatarModel] {
        return [
            AvatarModel(avatarid: UUID().uuidString, name: "Alpha", characterOption: .alien, characterAction: .smiling, characterLocation: .park, profileImageName: Constants.randomImage, authorId: UUID().uuidString, datecreated: .now),
            AvatarModel(avatarid: UUID().uuidString, name: "Beta", characterOption: .dog, characterAction: .eating, characterLocation: .forest, profileImageName: Constants.randomImage, authorId: UUID().uuidString, datecreated: .now),
            AvatarModel(avatarid: UUID().uuidString, name: "Gamma", characterOption: .cat, characterAction: .drinking, characterLocation: .museum, profileImageName: Constants.randomImage, authorId: UUID().uuidString, datecreated: .now),
            AvatarModel(avatarid: UUID().uuidString, name: "Delta", characterOption: .dog, characterAction: .shopping, characterLocation: .park, profileImageName: Constants.randomImage, authorId: UUID().uuidString, datecreated: .now)
        ]
    }
}
