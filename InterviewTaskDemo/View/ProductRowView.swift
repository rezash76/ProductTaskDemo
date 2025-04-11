//
//  ProductRowView.swift
//  InterviewTaskDemo
//
//  Created by Reza Sharifi on 4/11/25.
//

import SwiftUI

struct ProductRowView: View {
    let product: Product
    
    init(_ product: Product) {
        self.product = product
    }
    
    var body: some View {
        let iconName = RatingImageProvider.getSystemImageName(for: product.rating)
        let iconColor = RatingImageProvider.getImageColor(for: product.rating)
        HStack {
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
                .font(.system(size: 35))
            
            VStack(alignment: .leading) {
                Text(product.title)
                    .font(.headline)
                Text(product.formattedRating)
                    .font(.title3)
            }
            
        }
    }
}

#Preview {
    ProductRowView(Product.sampleData)
}


struct RatingImageProvider {
    static func getSystemImageName(for rating: Double) -> String {
        switch rating {
        case ..<3.0:
            return "star"
        case 3.0 ..< 4.0:
            return "star.leadinghalf.filled"
        default:
            return "star.fill"
        }
    }
    
    static func getImageColor(for rating: Double) -> Color {
        switch rating {
        case ..<3.0:
            return .red
        case 3.0 ..< 4.0:
            return .orange
        default:
            return .blue
        }
    }
}
