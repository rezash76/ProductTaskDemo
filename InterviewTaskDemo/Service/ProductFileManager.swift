//
//  CoreDataManager.swift
//  InterviewTaskDemo
//
//  Created by Reza Sharifi on 4/11/25.
//

import Foundation

class ProductStorage {
    
    private static let fileName = "products.json"

    private static var fileURL: URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent(fileName)
    }

    static func save(_ products: [Product]) {
        do {
            let data = try JSONEncoder().encode(products)
            try data.write(to: fileURL)
            print("✅ محصولات ذخیره شدند.")
        } catch {
            print("❌ خطا در ذخیره‌سازی: \(error)")
        }
    }

    // بارگذاری از فایل
    static func load() -> [Product]? {
        do {
            let data = try Data(contentsOf: fileURL)
            let products = try JSONDecoder().decode([Product].self, from: data)
            return products
        } catch {
            print("⚠️ فایل محصولات پیدا نشد یا خراب بود.")
            return nil
        }
    }
}
