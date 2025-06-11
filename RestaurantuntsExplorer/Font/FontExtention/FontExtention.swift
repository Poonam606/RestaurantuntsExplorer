//
//  FontExtention.swift
//  RestaurantuntsExplorer
//
//  Created by poonam on 09/06/25.
//

import Foundation
import SwiftUI
extension Font {
    static func inter(size: CGFloat, weight: Font.Weight = .regular) -> Font {
            return .custom("Inter", size: size).weight(weight)
        }
   
        
}
