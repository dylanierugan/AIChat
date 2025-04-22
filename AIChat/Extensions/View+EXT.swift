//
//  View+EXT.swift
//  AIChat
//
//  Created by Dylan Ierugan on 4/14/25.
//

import SwiftUI

extension View {
    
    func callToActionButton() -> some View {
        self
            .font(.headline)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 48)
            .background(.accent)
            .cornerRadius(16)
    }
    
}
