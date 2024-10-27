//
//  ProductJsonFetchView.swift
//  Tata 1mg
//
//  Created by Yashom on 27/10/24.
//

import SwiftUI

struct ProductJsonFetchView: View {
    @StateObject private var productLoader = ProductJsonFetchViewModel()

    var body: some View {
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(productLoader.products) { product in
                        ProductCellView(product: product) // Use a separate view for each product cell
                    }
                }
                .padding(.horizontal)
            }
            .onAppear {
                productLoader.loadProducts()
            }
        }
}

