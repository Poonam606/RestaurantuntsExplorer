//
//  RestaurantCardView.swift
//  RestaurantuntsExplorer
//
//  Created by poonam on 10/06/25.
//

import SwiftUI


struct RestaurantCardView: View {
    var cardWidth: CGFloat
    var imageName: String
    var name: String
    var rating: Double
    var priceLevel: String = "$ $$$"
    @ObservedObject var detailViewModel: RestaurantDetailViewModel
    var body: some View {
        VStack(alignment: .leading) {
            // Image with rating
            ZStack(alignment: .bottomTrailing) {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: cardWidth, height: 105)
                    .clipped()
                    .cornerRadius(9)
                
                HStack(spacing: 4) {
                    Image("starIcon")
                        .foregroundColor(.yellow)
                        
                    Text(String(format: "%.1f", rating))
                        .font(.inter(size: 12, weight: .bold))
                        .foregroundColor(.white)
                }
                .padding(6)
                .background(Color.black.opacity(0.5))
                .cornerRadius(10)
                .padding(6)
            }
         // Restaurant Name
            Text(name)
                .font(.inter(size: 16,weight: .semibold))
                .foregroundStyle(Color("grey3C3C3C"))
                .padding(.top, 4)
          // Dining type view
            HStack(spacing:3) {
                Image("dinnerIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16,height: 16)
                Text("Italian Fine Dining")
                    .font(.inter(size: 12,weight: .semibold))
                    .foregroundStyle(Color("grey555"))
            }
           
           // pricing view
            HStack(spacing:3) {
                Image("dollarIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16,height: 16)
                Image(detailViewModel.priceLevelImage(for: 2))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24,height: 12)
            }
           
        }
        .frame(width: cardWidth)
    }
    
}

struct ItalianDiningView: View {
    let cardWidth: CGFloat = UIScreen.main.bounds.width / 2.6
    let title: String
    @ObservedObject var detailViewModel: RestaurantDetailViewModel
    var body: some View {
        VStack(alignment: .leading) {
            // title
            Text(title)
                .font(.inter(size: 17,weight: .semibold))
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(0..<5,id: \.self) {_ in 
                        RestaurantCardView(cardWidth: cardWidth, imageName: "dishImage", name: "A Casa do Porco", rating: 4.8, detailViewModel: detailViewModel)
                    }
                   
                   
                }
                .scrollTargetLayout()
               
            }
            .scrollTargetBehavior(.paging)
           
        }
    }
}


#Preview {
    ItalianDiningView(title: "", detailViewModel: RestaurantDetailViewModel())
}
