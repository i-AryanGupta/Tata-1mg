//
//  CategoryDetailView.swift
//  Tata 1mg
//
//  Created by Yashom on 25/10/24.
//

import SwiftUI

struct CategoryDetailView: View {
    @State private var selectedCategory: String = "Medicine"
    @State private var showCart = false
    @ObservedObject var cartViewModel: CartViewModel

    let productCategories = Array(Set(ProductsFile().productCellData.map { $0.productType }))

    var products: [ProductCellData] {
        ProductsFile().productCellData.filter { $0.productType == selectedCategory }
    }

    var body: some View {
        NavigationView {
            HStack(spacing: 0) {
                // Sidebar with categories
                ScrollView(.vertical, showsIndicators: false) {
                    SideBarProductType(categories: productCategories, selectedCategory: $selectedCategory)
                        .frame(width: 100)
                        .padding(.top)
                        //.background(Color.orange)
                }

                // Products based on selected category
                ScrollView(.vertical, showsIndicators: true) {
                    VStack {
                        ProductBasedOnCategory(products: products, cartViewModel: cartViewModel, showCart: $showCart)
                    }
                }
            }
            .navigationTitle("Cold, Cough & Fever")
            .navigationBarItems(trailing: cartButton)
            .overlay(
                NavigationLink(destination: CartView(cartViewModel: cartViewModel), isActive: $showCart) {
                    EmptyView()
                }
                .transition(.move(edge: .trailing)) // Transition from the right
            )
        }
    }

    // Cart Button in the navigation bar
    private var cartButton: some View {
        Button(action: {
            showCart = true // Open the cart
        }) {
            ZStack {
                Image(systemName: "cart.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.gray)
                
                if cartViewModel.cartItems.count > 0 {
                    Text("\(cartViewModel.cartItems.count)")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 20, height: 20)
                        .background(Color.orange)
                        .clipShape(Circle())
                        .offset(x: 10, y: -10)
                }
            }
        }
    }
}



struct CategoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailView(cartViewModel: CartViewModel())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}


