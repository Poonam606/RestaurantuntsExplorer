//
//  PlaceHolderImageView.swift
//  RestaurantuntsExplorer
//
//  Created by poonam on 09/06/25.
//

import SwiftUI

struct PlaceHolderLoadingImageView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 36)
                .fill(Color(.lightGray)).opacity(0.2)
                .frame(height: 242)
            ProgressView()
                .frame(width: 30,height: 30,alignment: .center)
        }
    }
}



#Preview {
    PlaceHolderLoadingImageView()
}
