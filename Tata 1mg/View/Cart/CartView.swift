//
//  CartView.swift
//  Tata 1mg
//
//  Created by Yashom on 23/10/24.
//


import SwiftUI

struct CartView: View {
    @ObservedObject var cartViewModel: CartViewModel
    
    var body: some View {
        VStack {
            if cartViewModel.cartItems.isEmpty {
                Text("Your cart is empty.")
                    .font(.headline)
            } else {
                List {
                    ForEach(cartViewModel.cartItems) { item in
                        HStack {
                            Text(item.product.productName)
                            Spacer()
                            Text("\(item.quantity)")
                        }
                    }
                }
                
                // Dynamic bill summary
                VStack {
                    Text("Total: ₹\(String(format: "%.2f", cartViewModel.totalPrice))")
                        .font(.title)
                        .padding()
                    
                    Button(action: {
                        // Proceed to payment
                    }) {
                        Text("Continue to Pay")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Cart")
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a sample CartViewModel with some products
        let sampleCartViewModel = CartViewModel()
        
        // Add some sample items to the cart
        let sampleProduct1 = ProductCellData(
            productName: "Azithromycin",
            productImages: ["azit1"],
            productPrice: 150.30,
            productDiscountedPrice: 100.00,
            productType: "Medicine",
            productInformation: "Azithromycin is a commonly used antibiotic for treating bacterial infections."
        )
        let sampleProduct2 = ProductCellData(
            productName: "Paracetamol",
            productImages: ["pills1"],
            productPrice: 120.00,
            productDiscountedPrice: 90.00,
            productType: "Medicine",
            productInformation: "Paracetamol is used for pain relief and fever reduction."
        )
        
        // Add these products as cart items
        sampleCartViewModel.addToCart(product: sampleProduct1)
        sampleCartViewModel.addToCart(product: sampleProduct2)

        // Show the CartView in preview with the sample data
        return CartView(cartViewModel: sampleCartViewModel)
            .previewLayout(.sizeThatFits) // Adjust preview size
            .padding()
    }
}

