//
//  CoreDataManager.swift
//  InterviewTaskDemo
//
//  Created by Reza Sharifi on 4/11/25.
//

import Foundation

import Foundation

class ProductFileManager {
    
    static let shared = ProductFileManager()
    
    private let fileName = "products.json"
    
    private var fileURL: URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent(fileName)
    }

    func save(_ products: [Product]) {
        do {
            let data = try JSONEncoder().encode(products)
            try data.write(to: fileURL)
            print("Products saved successfully!")
        } catch {
            print(error.localizedDescription)
        }
    }

    func loadProducts() -> [Product]? {
        do {
            let data = try Data(contentsOf: fileURL)
            let products = try JSONDecoder().decode([Product].self, from: data)
            return products
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
