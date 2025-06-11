//
//  RestaurantSearchBar.swift
//  RestaurantuntsExplorer
//
//  Created by poonam on 11/06/25.
//

import SwiftUI

struct RestaurantSearchBar: View {
    @Binding var search : String 
    var body: some View {
       TextField("search", text: $search)
            .background(Color.white)
            .frame(height: 50)
       
        
    }
}

/*#Preview {
    RestaurantSearchBar(search: <#Binding<String>#>)
}*/
