//
//  NetworkRequestExecutor.swift
//  TestNetworkingProject
//
//  Created by Vasyl Nadtochii on 21.02.2023.
//

import Combine
import Foundation
import CryptoKit

class NetworkRequestExecutor {
    
    private let baseURL = "https://crypto2211.000webhostapp.com"
    
    private func createRequest(for url: URL, method: HTTPMethod) -> URLRequest {
        var request = URLRequest(url: url)

        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return request
    }
    
    func performRequest<T: Codable>(path: String, method: HTTPMethod) -> AnyPublisher<T, Error> {
        
        guard let url = URL(string: baseURL + path) else {
            return Fail(error: RuntimeError("Wrong URL was provided"))
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: createRequest(for: url, method: method))
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
