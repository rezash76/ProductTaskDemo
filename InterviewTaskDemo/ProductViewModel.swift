//
//  ProductViewModel.swift
//  InterviewTaskDemo
//
//  Created by Reza Sharifi on 4/11/25.
//

import SwiftUI
import Combine

class ProductViewModel: ObservableObject {
    
    // MARK: - Published properties
    @Published var products = [Product]()
    @Published var isLoading: Bool = true
    
    // MARK: - Service
    private let productService = ProductService()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscibers()
    }
    
    private func addSubscibers() {
        // listen to products data
        productService.$products
            .sink { [weak self] products in
                self?.products = products
                self?.isLoading = false
            }
            .store(in: &cancellables)
    }
}

