//
//  ErrorRetryView.swift
//  RestaurantuntsExplorer
//
//  Created by poonam on 10/06/25.
//

import SwiftUI

struct ErrorRetryView: View {
    let onTap: () -> Void
    let error : String
    var body: some View {
        VStack(alignment: .center,spacing:10) {
            Text(error)
                .font(.inter(size: 14,weight: .semibold))
                .foregroundColor(Color("grey4444"))
            Button("Try again") {
                onTap()
            }
            .font(.inter(size: 13,weight: .semibold))
            .foregroundColor(Color.red)
        }
    }
}

#Preview {
    ErrorRetryView(onTap: {}, error: "")
}
