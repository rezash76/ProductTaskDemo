//
//  Product.swift
//  InterviewTaskDemo
//
//  Created by Reza Sharifi on 4/11/25.
//

import Foundation

struct ProductAPIResponse: Codable {
    let products: [Product]
    let total: Int
    let skip: Int
    let limit: Int
}

struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let category: String
    let price: Double
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let tags: [String]
    let brand: String?
    let sku: String
    let weight: Double
    let dimensions: Dimensions
    let warrantyInformation: String
    let shippingInformation: String
    let availabilityStatus: String
    let reviews: [Review]
    let returnPolicy: String
    let minimumOrderQuantity: Int
    let meta: Meta
    let thumbnail: String
    let images: [String]
    
    var formattedPrice: String {
        "$\(price)"
    }
    
    var formattedDiscountPercentage: String {
        return "\(String(format: "%.1f", discountPercentage))%"
    }
    
    var formattedRating: String {
        return String(format: "%.1f", rating)
    }
    
    var thumbnailURL: URL? {
        return URL(string: thumbnail)
    }
}

struct Dimensions: Codable {
    let width: Double
    let height: Double
    let depth: Double
}

struct Review: Codable {
    let rating: Int
    let comment: String
    let date: String
    let reviewerName: String
    let reviewerEmail: String
}

struct Meta: Codable {
    let createdAt: String
    let updatedAt: String
    let barcode: String
    let qrCode: String
}


extension Product {
    static let sampleData: Product = .init(id: 1, title: "Essence Mascara Lash Princess", description: "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.", category: "beauty", price: 9.99, discountPercentage: 7.17, rating: 4.94, stock: 50, tags: ["beauty", "mascara"], brand: "Essence", sku: "RCH45Q1A", weight: 2, dimensions: .init(width: 23.17, height: 14.43, depth: 28.01), warrantyInformation: "1 month warranty", shippingInformation: "Ships in 1 month", availabilityStatus: "Low Stock", reviews: [.init(rating: 2, comment: "Very unhappy with my purchase!", date: "2024-05-23T08:56:21.618Z", reviewerName: "John Doe", reviewerEmail: "john.doe@x.dummyjson.com")], returnPolicy: "30 days return policy", minimumOrderQuantity: 24, meta: .init(createdAt: "2024-05-23T08:56:21.618Z", updatedAt: "2024-05-23T08:56:21.618Z", barcode: "9164035109868", qrCode: "..."), thumbnail: "...", images: ["...", "..."])
    
}
