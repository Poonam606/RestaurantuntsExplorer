//
//  RestaurantDetailHeader.swift
//  RestaurantuntsExplorer
//
//  Created by poonam on 10/06/25.
//

import SwiftUI

struct RestaurantDetailHeader: View {
    @ObservedObject var detailViewModel: RestaurantDetailViewModel
    var onBack: () -> Void
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
       // back button
           /* Button(action: onBack) {
                HStack(spacing: 4) {
                    Image(systemName: "chevron.left")
                        .font(.inter(size: 18, weight: .semibold))
                    Text("Back")
                        .font(.inter(size: 18, weight: .semibold))
                }
                .foregroundColor(.white)
                .padding(.top, safeAreaTop )
                .padding(.leading, 16)
            }*/
           
          
           
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
    RestaurantDetailHeader(detailViewModel: RestaurantDetailViewModel(), onBack: {})
}
