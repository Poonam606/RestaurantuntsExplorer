//
//  RestaurantNotesView.swift
//  RestaurantuntsExplorer
//
//  Created by poonam on 10/06/25.
//

import SwiftUI

struct RestaurantNotesView: View {
    let notice: String
    var body: some View {
        VStack(alignment:.leading,spacing: 10) {
            Text(RestaurantDetailConstant.noticeTitle)
                .font(.inter(size: 17,weight: .semibold))
                .foregroundStyle(Color("grey34353"))
            Text(notice)
                .font(.inter(size: 15,weight: .medium))
                .foregroundStyle(Color("grey4f4f"))
                .lineSpacing(3)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 20)
        .background(LinearGradient(colors: [Color("noteGradient1").opacity(0.1),Color("noteGradient1").opacity(0.1)], startPoint: .leading, endPoint: .trailing))
        .clipShape(RoundedRectangle(cornerRadius: 22))
    }
}

#Preview {
    RestaurantNotesView(notice: "")
}
