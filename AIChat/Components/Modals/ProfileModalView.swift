//
//  ProfileModalView.swift
//  AIChat
//
//  Created by Dylan Ierugan on 10/16/25.
//

import SwiftUI

struct ProfileModalView: View {
    
    var imageName: String? = Constants.randomImage
    var title: String? = "Alpha"
    var subtitle: String? = "Alien"
    var headline: String? = "An alien in the park."
    var onXmarkTapped: () -> Void = { }
    
    var body: some View {
        VStack(spacing: 0) {
            if let imageName {
                ImageLoaderView(urlString: imageName)
                    .aspectRatio(1, contentMode: .fit)
            }
            
            VStack(alignment: .leading, spacing: 16) {
                if let title {
                    Text(title)
                        .font(.title)
                        .fontWeight(.semibold)
                }
                if let subtitle {
                    Text(subtitle)
                        .font(.title3)
                        .foregroundStyle(.secondary)
                }
                if let headline {
                    HStack {
                        Text(headline)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .padding(24)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(.ultraThinMaterial)
        .cornerRadius(16)
        .overlay(
            Image(systemName: "xmark.circle.fill")
                .font(.title)
                .foregroundStyle(Color.black)
                .padding(4)
                .tappableBackground()
                .anyButton {
                    onXmarkTapped()
                }
                .padding(8)
            
            , alignment: .topTrailing
        )
    }
}

#Preview("Modal with Image") {
    ZStack {
        Color.gray.ignoresSafeArea()
        
        ProfileModalView()
            .padding(40)
    }
}

#Preview("Modal without Image") {
    ZStack {
        Color.gray.ignoresSafeArea()
        
        ProfileModalView(imageName: nil)
            .padding(40)
    }
}
