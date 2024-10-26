//
//  CartBottomBarView.swift
//  Tata 1mg
//
//  Created by Yashom on 24/10/24.
//

import SwiftUI

struct CartBottomBarView: View {
    @State private var showOrderNow = false
    var cartViewModel: CartViewModel
    var totalPrice: Double

    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Image(systemName: "location.fill")
                    .foregroundColor(.red)
                Text("Home")
                    .font(.headline)
                Spacer()
                Button(action: {
                    // Handle Change Address action
                }) {
                    Text("Change")
                        .font(.subheadline)
                        .foregroundColor(.red)
                }
            }
            
            Divider()

            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("₹\(String(format: "%.0f", totalPrice))")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Button(action: {
                        // Handle See Bill Summary action
                    }) {
                        Text("See bill summary")
                            .font(.caption)
                            .foregroundColor(.red)
                    }
                }
                Spacer()

                // Order Now Button
                Button(action: {
                    // Show OrderPageView with the current cart items without clearing them here
                    showOrderNow = true
                }) {
                    Text("Order Now")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 120)
                        .background(Color.red)
                        .cornerRadius(10)
                }
            }
        }
        .padding(.horizontal, 5)
        .padding(.vertical, 10)
        .background(Color.white)
        
        // Use bgNavLink to navigate to OrderPageView with a copy of cart items
        .bgNavLink(
            content: OrderPageView(
                orderedItems: cartViewModel.getCartSnapshot(), // Pass a snapshot here
                totalPrice: totalPrice,
                deliveryDate: "26 - 28 October",
                onDisappear: { cartViewModel.clearCart() } // Clear the cart on view dismissal
            ),
            isAction: $showOrderNow
        )
    }
}
