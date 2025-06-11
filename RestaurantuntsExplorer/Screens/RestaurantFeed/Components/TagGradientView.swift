//
//  TagGradientView.swift
//  RestaurantuntsExplorer
//
//  Created by poonam on 10/06/25.
//

import SwiftUI
//MARK: Tag GradientWithText
struct TagGradientView: View {
    let image: String
    let text: String
    let greadient1: Color
    let greadient2: Color
    let forground: Color
    let fontSize: CGFloat
    var body: some View {
            HStack(spacing:5) {
                Image(image)
                    .resizable()
                    .frame(width: 24,height: 24)
                Text(text)
                    .font(.inter(size: fontSize, weight: .semibold))
                  
            }
            .foregroundColor(forground)
            .padding(.horizontal, 17)
            .padding(.vertical, 12)
            .background(LinearGradient(colors: [Color(greadient1),Color(greadient2)], startPoint: .leading, endPoint: .trailing))
            .clipShape(Capsule() )
            .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
    }
}

//MARK: Tag GradientWithImage
struct TagGradientWithImageView: View {
    let image: String
    let image1: String
    let greadient1: Color
    let greadient2: Color
    let forground: Color
    let fontSize: CGFloat
    var body: some View {
        HStack(spacing:5) {
            Image(image)
                .resizable()
                .frame(width: 24,height: 24)
            Image(image1)
                .resizable()
                .frame(width: 32,height: 16)
            
        }
        .foregroundColor(forground)
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(LinearGradient(colors: [Color(greadient1),Color(greadient2)], startPoint: .leading, endPoint: .trailing))
        .clipShape(Capsule() )
        .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
    }
}



#Preview {
    TagGradientWithImageView(image: "dollarIcon",image1: "dollar1", greadient1: Color("blugradient1").opacity(0.1), greadient2: Color("blugradient2").opacity(0.1), forground: Color("grey3C3C3C"), fontSize: 14)
}



