//
//  ApiHelper.swift
//  RestaurantuntsExplorer
//
//  Created by poonam on 09/06/25.
//

import Foundation



final class ApiHelper{
    static let shared = ApiHelper()
    // restrict creating multiple instance
    private init(){
     }
    func getRequest<T:Decodable>(endPoint:String) async throws -> T {
        guard let url = URL(string: endPoint) else {
            throw ApiEnumError.invalidUrl
        }
        let (data,response) = try await URLSession.shared.data(from: url)
        guard let reponse = response as? HTTPURLResponse, reponse.statusCode == 200 else {
            throw ApiEnumError.invalidResponse
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}
