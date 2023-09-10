//
//  APIManager.swift
//  CookRecipe-RIBs
//
//  Created by 최윤제 on 2023/09/10.
//

import Foundation

class APIManager {
    
    private init() {}
    
    static let shared = APIManager()
    
    enum APIError: Error {
        case failedRequest, noData, invalidResponse, failedResponse, invalidData
    }
    
    func requestAPI(text: String) async throws -> CookRecipe {
        let query = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = URL(string: "\(APIKey.url)\(query)")!
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw APIError.failedResponse
        }
        
        do {
            let result = try JSONDecoder().decode(CookRecipe.self, from: data)
            return result
        } catch {
            throw APIError.invalidData
        }
    }
}
