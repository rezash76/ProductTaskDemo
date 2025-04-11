//
//  ProductService.swift
//  InterviewTaskDemo
//
//  Created by Reza Sharifi on 4/11/25.
//

import Foundation
import Combine

class ProductService {
    
    @Published var products: [Product] = []
    private var cancellable: AnyCancellable?
    
    private let networkManager = NetworkManager.shared
    
    init() {
        getProducts()
    }
    
    func getProducts() {
        guard let url = URL(string: "https://dummyjson.com/products") else { return }
        
        cancellable = networkManager.fetchData(from: url)
            .decode(type: ProductAPIResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            }) { [weak self] productResponse in
                self?.products = productResponse.products
                self?.cancellable?.cancel()
            }
    }
}
