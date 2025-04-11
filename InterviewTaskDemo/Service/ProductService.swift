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
    private let productFileManager = ProductFileManager.shared
    
    init() {
        getProducts()
    }
    
    func getProducts() {
        
        if let localProducts = productFileManager.loadProducts(), !localProducts.isEmpty {
            self.products = localProducts
            return
        }
        
        fetchProductsFromAPI()
    }
    
    private func fetchProductsFromAPI() {
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
                guard let self else { return }
                self.products = productResponse.products
                self.productFileManager.save(productResponse.products)
                self.cancellable?.cancel()
            }
    }
}
