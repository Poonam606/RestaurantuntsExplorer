//
//  RestaurantFeedCell.swift
//  RestaurantuntsExplorer
//
//  Created by poonam on 09/06/25.
//

import SwiftUI
struct RestaurantFeedCell: View {
    @ObservedObject var viewModel : RestaurantFeedViewModel
    let restaurant : Restaurant
    var body: some View {
        VStack (alignment: .leading){
            // name , address, rating view
            VStack(alignment:.leading,spacing: 7) {
                Text(restaurant.attributes.name)
                    .font(.inter(size: 22,weight: .semibold))
                    .foregroundStyle(Color("grey34353"))
                    .multilineTextAlignment(.leading)
                HStack {
                    Text(restaurant.attributes.addressLine1)
                        .font(.inter(size: 13,weight: .semibold))
                        .foregroundStyle(Color("grey4f4f"))
                    Spacer()
                    HStack(spacing:2) {
                        Image("starIcon")
                            .resizable()
                            .frame(width:16.7,height: 16.7)
                        Text(restaurant.attributes.ratingsAverage ?? "0.0")
                            .font(.inter(size: 13,weight: .semibold))
                            .foregroundStyle(Color("grey4444"))
                    }
                }
            }
            // restaurant image
            ZStack (alignment: .leading){
                if let image = restaurant.attributes.imageURL, let url = URL(string: image) {
                    AsyncImage(url: url){ image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(height: 242)
                            .clipShape(RoundedRectangle(cornerRadius: 36))
                    } placeholder: {
                        PlaceHolderLoadingImageView()
                    }
                } else {
                    PlaceHolderLoadingImageView()
                }
                // tags on image view
                VStack (alignment:.leading,spacing: 10){
                    let priceLevel = restaurant.attributes.priceLevel
                    TagView( text: viewModel.priceLevelText(for: priceLevel), background: Color(.white), forground: Color("grey4444"), fontSize: 13)
                    TagView( text: restaurant.attributes.cuisine, background: Color(.white), forground: Color("grey4444"), fontSize: 13)
                }
                .padding(.top, 120)
                .padding(.leading, 16)
            }
        }
    }
}

/*#Preview {
    RestaurantFeedCell()
}*/
