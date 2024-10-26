//
//  CartItemView.swift
//  Tata 1mg
//
//  Created by Yashom on 24/10/24.
//
import SwiftUI

struct CartItemView: View {
    var item: CartItem
    @ObservedObject var cartViewModel: CartViewModel
    
    var body: some View {
        VStack {
            HStack {
                // Product Image
                Image(item.product.productImages.first ?? "defaultImage")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(8)
                
                // Product Info
                VStack(alignment: .leading, spacing: 5) {
                    Text(item.product.productName)
                        .font(.headline)
                    
                    Text("Strip of 5 tablets")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    HStack(spacing: 10) {
                        // Price VStack (stacked prices)
                        VStack(alignment: .leading, spacing: 0) {
                            Text("₹\(String(format: "%.0f", item.product.productDiscountedPrice))")
                                .font(.headline)
                            
                            Text("₹\(String(format: "%.2f", item.product.productPrice))")
                                .font(.subheadline)
                                .strikethrough()
                                .foregroundColor(.gray)
                        }
                        
                        // Percentage off to the right
                        Text("\(Int((item.product.productPrice - item.product.productDiscountedPrice) / item.product.productPrice * 100))% off")
                            .font(.subheadline)
                            .foregroundColor(.green)
                    }
                    
                    Button(action: {
                        // Safely remove the item from the cart without affecting navigation
                        cartViewModel.updateQuantity(for: item.product, quantity: 0)
                    }) {
                        Text("Remove")
                            .font(.caption)
                            .foregroundColor(.blue)
                    }
                }
                Spacer()

                // Stepper for quantity adjustment
                HStack(spacing: 10) {
                    Button(action: {
                        if item.quantity > 1 {
                            // Safely update the quantity in the cart
                            cartViewModel.updateQuantity(for: item.product, quantity: item.quantity - 1)
                        }
                    }) {
                        Image(systemName: "minus")
                            .frame(width: 30, height: 30)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(15)
                    }

                    Text("\(item.quantity)")
                        .font(.body)
                        .frame(width: 30, height: 30)

                    Button(action: {
                        // Safely update the quantity in the cart
                        cartViewModel.updateQuantity(for: item.product, quantity: item.quantity + 1)
                    }) {
                        Image(systemName: "plus")
                            .frame(width: 30, height: 30)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(15)
                    }
                }
            }
            Divider().padding(.vertical, 8)
        }
        .padding(.vertical)
        // Ensure the view is not refreshed unnecessarily, causing navigation issues
        .id(item.id) // Give each item a unique identity to prevent full list refreshes
    }
}
