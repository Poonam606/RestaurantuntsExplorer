//
//  ImageTitleWithButton.swift
//  RestaurantuntsExplorer
//
//  Created by poonam on 10/06/25.
//

import SwiftUI

struct ImageTitleWithButton: View {
    let image : String
    let title: String
    let titleColor: String
    let subTitle: String
    let subTitleColor: String
    let onTap: () -> Void
    var body: some View {
        Button(action: {
            onTap()
        }){
            HStack {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24,height: 24)
                VStack(alignment:.leading,spacing: 2) {
                    Text(title)
                        .font(.inter(size: 17, weight: .medium))
                        .foregroundColor(Color(titleColor))
                        .lineLimit(1)
                    Text(subTitle)
                        .font(.inter(size: 12, weight: .medium))
                        .foregroundColor(Color(subTitleColor))
                }
                Spacer()
                Image("rightArrow")
            }
        }
    }
}

#Preview {
    ImageTitleWithButton(image: "locationIcon", title: "Radisson Blue Hotel, Business Bay", titleColor: "grey3C3C3C", subTitle: "See venue's adress in google maps", subTitleColor: "grey6f6f", onTap: {})
}
