//
//  MainView.swift
//  InterviewTaskDemo
//
//  Created by Reza Sharifi on 4/11/25.
//

import SwiftUI

struct ProductsView: View {
    @EnvironmentObject var productViewModel: ProductViewModel
    
    var body: some View {
        VStack {
            mainCoinList
        }
    }
}

extension ProductsView {
    private var mainCoinList: some View {
        NavigationStack {
            List {
                ForEach(productViewModel.products) { product in
                    NavigationLink {
                        ProductDetailView(product)
                    } label: {
                        ProductRowView(product)
                    }
                }
            }
            .navigationTitle("Products")
            .navigationBarTitleDisplayMode(.large)
        }
        .listStyle(.inset)
    }
}

#Preview {
    NavigationStack {
        ProductsView()
            .environmentObject(ProductViewModel())
    }
}
