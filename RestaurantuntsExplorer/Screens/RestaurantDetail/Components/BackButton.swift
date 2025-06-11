//
//  BackButton.swift
//  RestaurantuntsExplorer
//
//  Created by poonam on 11/06/25.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button(action: {
            dismiss()
        }) {
            HStack(spacing:1) {
                Image("backIcon")
                    .resizable()
                    .frame(width: 32,height: 32)
                Text("Back")
                    .font(.inter(size: 18,weight: .semibold))
                    .foregroundStyle(.white)
            }
            .shadow(radius: 1)
        }
       
        .font(.title)
    }
}

#Preview {
    BackButton()
}
