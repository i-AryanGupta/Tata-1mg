//
//  HomePageView.swift
//  Tata 1mg
//
//  Created by Yashom on 21/10/24.
//

import SwiftUI

struct HomePageView: View {
    @State private var searchText: String = ""
    @StateObject private var cartViewModel = CartViewModel()
    @State private var showCart = false
    @State private var showLocation = false
    let productsFile = ProductsFile()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {
                    // Top bar with Location and Cart buttons
                    HStack {
                        Button(action: {
                            showLocation = true
                        }) {
                            HStack {
                                Image(systemName: "location.fill")
                                    .font(.title3)
                                    .foregroundColor(Color.white)
                                    .frame(width: 40, height: 40)
                                    .background(Color.btnBG)
                                    .cornerRadius(22)
                                
                                Text("Bangalore")
                                    .font(.headline)
                                    .foregroundColor(Color.primaryText)
                            }
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            showCart = true
                        }) {
                            HStack {
                                Image(systemName: "cart.fill")
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(Color.white)
                                    .background(Color.gray.opacity(0.5))
                                    .cornerRadius(22)
                                
                                // Show the cart count dynamically
                                if cartViewModel.cartItems.count > 0 {
                                    Text("\(cartViewModel.cartItems.count)")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .frame(width: 20, height: 20)
                                        .background(Color.red)
                                        .clipShape(Circle())
                                        .offset(x: -10, y: -10)
                                }
                            }
                        }
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    
                    // Search bar
                    SearchBarProductView()
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                    
                    // Top section (could be promotions, categories, etc.)
                    TopSelfSection()
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                    
                    // Wellness and Medicine product sections
                    VStack(alignment: .leading) {
                        // Wellness Products
                        Text("Wellness Products")
                            .font(.headline)
                            .padding(.leading, 20)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                productStack(for: "Wellness")
                            }
                            .padding(.horizontal)
                        }
                        
                        // Medicine Products
                        Text("Medicine Products")
                            .font(.headline)
                            .padding(.leading, 20)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                productStack(for: "Medicine")
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.horizontal)
                    
                } // VStack
            } // ScrollView
        } // NavigationView
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
        .bgNavLink(content: CartView(cartViewModel: cartViewModel), isAction: $showCart)
        //.bgNavLink(content: LocationView(), isAction: $showLocation)
    }
    
    // Method to generate a stack of products based on their type
    func productStack(for type: String) -> some View {
        let filteredProducts = productsFile.productCellData.filter { $0.productType == type }
        
        return ForEach(filteredProducts) { product in
            ProductCellDataReusable(cartViewModel: cartViewModel, product: product)
        }
    }
}




struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
