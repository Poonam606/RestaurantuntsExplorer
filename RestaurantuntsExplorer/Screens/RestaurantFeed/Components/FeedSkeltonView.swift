//
//  FeedSkeltonView.swift
//  RestaurantuntsExplorer
//
//  Created by poonam on 09/06/25.
//

import SwiftUI

struct FeedSkeltonView: View {
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 12) {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 200)
                }
                VStack(alignment: .leading, spacing: 12) {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 200)
                }
                VStack(alignment: .leading, spacing: 12) {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 200)
                }
                VStack(alignment: .leading, spacing: 12) {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 200)
                }
            }
            .padding()
       }
      .modifier(Shimmer())
     
    }
}


public struct Shimmer: ViewModifier {
    @State var isInitialState: Bool = true
    public func body(content: Content) -> some View {
        content
            .mask {
                LinearGradient(
                    gradient: .init(colors: [.black.opacity(0.4), .black, .black.opacity(0.4)]),
                    startPoint: (isInitialState ? .init(x: -0.3, y: -0.3) : .init(x: 1, y: 1)),
                    endPoint: (isInitialState ? .init(x: 0, y: 0) : .init(x: 1.3, y: 1.3))
                )
            }
            .animation(.linear(duration: 1.5).delay(0.25).repeatForever(autoreverses: false), value: isInitialState)
            .onAppear() {
                isInitialState = false
            }
    }
}
#Preview {
    FeedSkeltonView()
}
