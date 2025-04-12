//
//  ProductDetailView.swift
//  InterviewTaskDemo
//
//  Created by Reza Sharifi on 4/11/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductDetailView: View {
    
    let product: Product
    
    init(_ product: Product) {
        self.product = product
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                productImage
                productTitle
                productPriceDetail
                Divider()
                productDescription
                    .padding(.top)
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Product Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

extension ProductDetailView {
    var productImage: some View {
        WebImage(url: product.thumbnailURL)
            .resizable()
            .indicator(.progress)
            .transition(.fade)
            .scaledToFit()
            .frame(height: 250)
    }
    
    var productTitle: some View {
        Text(product.title)
            .font(.title.bold())
    }
    
    var productPriceDetail: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(product.formattedPrice)
                Spacer()
                Text("Stock: \(product.stock)")
            }
            .font(.subheadline)
            
            Text("Discount: \(product.formattedDiscountPercentage)")
                .font(.subheadline)
                .foregroundColor(.red)
        }
    }
    
    var productDescription: some View {
        Text(product.description)
            .font(.body)
    }
}

#Preview {
    ProductDetailView(Product.sampleData)
}
