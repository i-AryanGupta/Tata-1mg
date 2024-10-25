//
//  CartBottomBarView.swift
//  Tata 1mg
//
//  Created by Yashom on 24/10/24.
//

import SwiftUI

struct CartBottomBarView: View {
    @State private var showHealthplan = false
    var totalPrice: Double

    var body: some View {
        VStack(spacing: 10) {
            // First HStack: Location and Change Button
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

            // Second HStack: Price, Bill Summary, and Continue Button
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

                // Order Now Button (Styled similarly to "Continue")
                Button(action: {
                    showHealthplan = true
                }) {
                    Text("Order Now")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 120) // Fixed width for the button
                        .background(Color.red)
                        .cornerRadius(10)
                }
            }
        }
        .padding(.horizontal, 5) // Padding on both sides
        .padding(.vertical, 10)  // Padding vertically for spacing
        .background(Color.white)
        .bgNavLink(content: HealthPlansView(), isAction: $showHealthplan)
    }
}


struct CartBottomBarView_Previews: PreviewProvider {
    static var previews: some View {
        CartBottomBarView(totalPrice: 740.00)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
