//
//  ProductPageView.swift
//  Tata 1mg
//
//  Created by Yashom on 24/10/24.
//

import SwiftUI

struct ProductPageView: View {
    @ObservedObject var cartViewModel: CartViewModel
    var product: ProductCellData
    @State private var showCart = false
    
    var body: some View {
        NavigationView {
            VStack {
                // Cart button at top right
                HStack {
                    Spacer() // Pushes the cart button to the right
                    
                    Button(action: {
                        showCart = true
                    }) {
                        Image(systemName: "cart.fill")
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                            .background(Color.gray.opacity(0.5))
                            .cornerRadius(22)
                        
                        // Show the cart count dynamically
                        if cartViewModel.cartItems.count > 0 {
                            Text("\(cartViewModel.cartItems.count)")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(width: 20, height: 20)
                                .background(Color.orange)
                                .clipShape(Circle())
                                .offset(x: -10, y: -10)
                        }
                    }
                    .padding()
                }
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        // Scrollable Product Images
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(product.productImages, id: \.self) { image in
                                    Image(image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 200, height: 200)
                                        .cornerRadius(10)
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                        // Product Information
                        VStack(alignment: .leading, spacing: 10) {
                            // Product Name
                            Text(product.productName)
                                .font(.title)
                                .fontWeight(.bold)
                            
                            // Product Type
                            Text(product.productType)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            // Price and Discounted Price
                            HStack {
                                Text("₹\(String(format: "%.2f", product.productDiscountedPrice))")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                
                                Text("₹\(String(format: "%.2f", product.productPrice))")
                                    .font(.subheadline)
                                    .strikethrough()
                                    .foregroundColor(.gray)
                                
                                Text("\(Int((product.productPrice - product.productDiscountedPrice) / product.productPrice * 100))% off")
                                    .foregroundColor(.green)
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                            }
                            
                            // Add to Cart Button
                            Button(action: {
                                cartViewModel.addToCart(product: product)
                            }) {
                                Text("Add to Cart")
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.orange)
                                    .cornerRadius(10)
                            }
                        }
                        .padding(.horizontal)
                        
                        // Product Description
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Product Description")
                                .font(.headline)
                            
                            Text(product.productInformation ?? "No information available.")
                                .font(.body)
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal)
                    }
                    .padding(.top)
                }
            }
            .navigationBarHidden(true) // Hide the default navigation bar
            .bgNavLink(content: CartView(cartViewModel: cartViewModel), isAction: $showCart) // Cart view navigation
        }
    }
}

// Preview
struct ProductPageView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a sample CartViewModel and Product for preview
        let mockCartViewModel = CartViewModel()
        let sampleProduct = ProductCellData(
            productName: "Paracetamol",
            productImages: ["pills1", "pills2"],
            productPrice: 150.00,
            productDiscountedPrice: 125.00,
            productType: "Medicine",
            productInformation: "Effective pain relief for headaches and muscle pain."
        )
        
        return ProductPageView(cartViewModel: mockCartViewModel, product: sampleProduct)
    }
}
