//
//  CompletedView.swift
//  AIChat
//
//  Created by Dylan Ierugan on 4/14/25.
//

import SwiftUI

struct CompletedView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Onboarding Completed")
            Spacer()
            
            Button {
                
            } label: {
                Text("Finish")
                    .callToActionButton()
            }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    CompletedView()
}
