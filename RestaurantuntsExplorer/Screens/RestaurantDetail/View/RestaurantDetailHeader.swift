//
//  RestaurantDetailHeader.swift
//  RestaurantuntsExplorer
//
//  Created by poonam on 10/06/25.
//

import SwiftUI

struct RestaurantDetailHeader: View {
    @ObservedObject var detailViewModel: RestaurantDetailViewModel
    var body: some View {
        ZStack (alignment:.topLeading){
            
            // image
            if let image = detailViewModel.restaurant?.attributes.imageURL, let url = URL(string: image) {
                AsyncImage(url: url){ image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .frame(height: 342)
                } placeholder: {
                    Color(.lightGray).opacity(0.2)
                }
            } else {
                     Color(.lightGray).opacity(0.2)
            }
        }
        .frame(height: 342)
        .edgesIgnoringSafeArea(.top)
    }
    /// Helper to read the top safe area inset
        private var safeAreaTop: CGFloat {
            UIApplication.shared.connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .first?.windows.first?.safeAreaInsets.top ?? 0
        }
}

#Preview {
    RestaurantDetailHeader(detailViewModel: RestaurantDetailViewModel())
}
