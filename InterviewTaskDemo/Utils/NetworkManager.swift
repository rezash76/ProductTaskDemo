//
//  NetworkManager.swift
//  InterviewTaskDemo
//
//  Created by Reza Sharifi on 4/11/25.
//

import Foundation
import Combine

class NetworkManager {
    
    static let shared = NetworkManager()
    
    // MARK: - Error enum
    enum NetworkError: LocalizedError {
        case badURLResponse(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badURLResponse(let url): "Bad URL Response: \(url)"
            case .unknown: "Unknown Error"
            }
        }
    }
    
    
    // MARK: - Functions
    func fetchData(from url: URL) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap({ data, response in
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else {
                    throw NetworkError.badURLResponse(url: url)
                }
                return data
            })
            .retry(3)
            .eraseToAnyPublisher()
    }
}
