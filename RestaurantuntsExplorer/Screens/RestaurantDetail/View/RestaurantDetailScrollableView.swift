//
//  RestaurantDetailScrollableView.swift
//  RestaurantuntsExplorer
//
//  Created by poonam on 10/06/25.
//

import SwiftUI

struct RestaurantDetailScrollableView: View {
    @ObservedObject var detailViewModel: RestaurantDetailViewModel
    var body: some View {
        ScrollView {
            VStack (alignment: .leading,spacing: 30){
                // name and rating view
                VStack {
                    Text("")
                    HStack {
                        Text(detailViewModel.restaurant?.attributes.name ?? "" )
                            .font(.inter(size: 24, weight: .semibold))
                        HStack(spacing:2) {
                            Image("starIcon")
                                .resizable()
                                .frame(width:16.7,height: 16.7)
                            Text(detailViewModel.restaurant?.attributes.ratingsAverage ?? "")
                                .font(.inter(size: 13,weight: .semibold))
                                .foregroundStyle(Color("grey4444"))
                        }
                    }
                }
                //description
                Text(detailViewModel.restaurant?.attributes.description ?? "")
                    .font(.inter(size: 15,weight: .medium))
                    .foregroundStyle(Color("grey3C3C3C"))
                    .multilineTextAlignment(.leading)
                // pricing and cutlury
                HStack {
                    TagGradientWithImageView(image: "dollarIcon", image1: detailViewModel.priceLevelImage(for: detailViewModel.restaurant?.attributes.priceLevel), greadient1: Color("blugradient1").opacity(0.1), greadient2: Color("blugradient2").opacity(0.1), forground: Color("grey3C3C3C"), fontSize: 14)
                    TagGradientView(image: "dinnerIcon", text: detailViewModel.restaurant?.attributes.cuisine ?? "", greadient1: Color("yellowGradient1").opacity(0.1), greadient2: Color("yellowGradient1").opacity(0.1), forground: Color("grey3C3C3C"), fontSize: 14)
                }
                //venu address and menu
                VStack(spacing:20){
                    ImageTitleWithButton(image: "locationIcon", title: detailViewModel.restaurant?.attributes.addressLine1 ?? "" , titleColor: "grey3C3C3C", subTitle: RestaurantDetailConstant.addressMessage, subTitleColor: "grey6f6f", onTap: {
                        
                    })
                    //
                    ImageTitleWithButton(image: "menuIcon", title: RestaurantDetailConstant.menuTitle, titleColor: "grey3C3C3C", subTitle: RestaurantDetailConstant.menuMessage, subTitleColor: "grey6f6f", onTap: {
                        
                    })
                }
                // notes
                if let notice = detailViewModel.restaurant?.attributes.notice  {
                    RestaurantNotesView(notice: notice)
                } else {
                    RestaurantNotesView(notice: RestaurantDetailConstant.noticeDescription)
                }
                // labels grid view
                TagGridView(tags: detailViewModel.restaurant?.attributes.labels ?? [])
                // dining view
                VStack (spacing: 25){
                    ItalianDiningView(title: RestaurantDetailConstant.bottomScrollableTitle1, detailViewModel: detailViewModel)
                    ItalianDiningView(title: RestaurantDetailConstant.bottomScrollableTitle1, detailViewModel: detailViewModel)
                }
                Spacer()
                
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.blue.opacity(0.4), lineWidth: 1)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
            )
           
        }
      

    }
}

#Preview {
    RestaurantDetailScrollableView(detailViewModel: RestaurantDetailViewModel())
}
