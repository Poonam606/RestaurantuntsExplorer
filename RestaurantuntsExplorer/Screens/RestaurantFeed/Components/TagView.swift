//
//  TagView.swift
//  RestaurantuntsExplorer
//
//  Created by poonam on 09/06/25.
//

import SwiftUI

struct TagView: View {
    let text: String
    let background: Color
    let forground: Color
    let fontSize: CGFloat
    var body: some View {
        Text(text)
            .font(.inter(size: fontSize, weight: .semibold))
            .foregroundColor(forground)
            .padding(.horizontal, 16)
            .padding(.vertical,10)
            .background(background)
            .clipShape(Capsule())
            .multilineTextAlignment(.center)
            .lineLimit(nil) // Allow wrapping
            .fixedSize(horizontal: false, vertical: true)
            .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
    }
}
#Preview {
    TagView( text: "InternationalInternational", background: Color(.gray), forground: .white, fontSize: 13)
}
