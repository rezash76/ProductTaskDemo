//
//  ProductDetailView.swift
//  InterviewTaskDemo
//
//  Created by Reza Sharifi on 4/11/25.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: Product
    
    init(_ product: Product) {
        self.product = product
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: URL(string: product.thumbnail)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 250)
                        .clipped()
                        .cornerRadius(20)
                } placeholder: {
                    ProgressView()
                        .frame(height: 400)
                }

                Text(product.title)
                    .font(.title.bold())

                HStack {
                    Text(product.formattedPrice)
                    Spacer()
                    Text("Stock: \(product.stock)")
                }
                .font(.subheadline)

                Text("Discount: \(product.formattedDiscountPercentage)")
                    .font(.subheadline)
                    .foregroundColor(.red)
                
                
                Text(product.description)
                    .font(.body)
                    .padding(.top)

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Product Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProductDetailView(Product.sampleData)
}
