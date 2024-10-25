//
//  CategoryDetailView.swift
//  Tata 1mg
//
//  Created by Yashom on 25/10/24.
//

import SwiftUI

struct CategoryDetailView: View {
    @State private var selectedCategory: String = "Medicine"
    @ObservedObject var cartViewModel: CartViewModel
    
    let productCategories = Array(Set(ProductsFile().productCellData.map { $0.productType }))
    
    var products: [ProductCellData] {
        ProductsFile().productCellData.filter { $0.productType == selectedCategory }
    }
    
    var body: some View {
        HStack(spacing: 0) {
            // Sidebar with categories
            ScrollView(.vertical, showsIndicators: false) {
                SideBarProductType(categories: productCategories, selectedCategory: $selectedCategory)
                    .frame(width: 100)
                    .padding(.top)
                    .background(Color.orange)
            }

            // Products based on selected category
            ScrollView(.vertical, showsIndicators: true) {
                VStack {
                    ProductBasedOnCategory(products: products, cartViewModel: cartViewModel)
                }
            }
        }
        .navigationTitle("Cold, Cough & Fever")
    }
}


struct CategoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailView(cartViewModel: CartViewModel())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}


