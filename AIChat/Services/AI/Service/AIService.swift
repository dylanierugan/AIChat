//
//  AIService.swift
//  AIChat
//
//  Created by Dylan Ierugan on 12/20/25.
//

import SwiftUI

protocol AIService: Sendable {
    func generateImage(input: String) async throws -> UIImage
}
