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
            // Savings Section
            HStack {
                Text("₹\(String(format: "%.0f", cartViewModel.totalSavings)) saved on this order")
                    .font(.headline)
                    .foregroundColor(.green)
                Spacer()
            }
            .padding()

            // Delivery Date Section
            HStack {
                Image(systemName: "car")
                    .resizable()
                    .frame(width: 30, height: 24)
                    .padding(.trailing, 10)
                VStack(alignment: .leading) {
                    Text("Delivery by")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text("26 - 28 October")
                        .font(.headline)
                        .foregroundColor(.blue)
                }
                Spacer()
            }
            .padding(.horizontal)
            //.Divider().padding(.vertical, 8)
            
            ScrollView{
                
                // Cart Items List
                VStack {
                    ForEach(cartViewModel.cartItems) { item in
                        CartItemView(item: item, cartViewModel: cartViewModel)
                    }
                }
                Button(action: {
                    // Apply coupon action
                }) {
                    HStack {
                        Image(systemName: "tag")
                        Text("Apply coupon")
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .padding()
                    .foregroundColor(.green)
                }
                .background(Color.white)
                
                DetailCart()
            }
        }
        .padding(.horizontal)
    }
}

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
                    
                    Text("Strip of 5 tablets") // Dynamic product description if necessary
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
                                .font(.caption)
                        }
                        
                        // Percentage off to the right
                        Text("\(Int((item.product.productPrice - item.product.productDiscountedPrice) / item.product.productPrice * 100))% off")
                            .font(.subheadline)
                            .foregroundColor(.green)
                    }
                    
                    // Remove Button (Optional if needed, can comment out)
                    Button(action: {
                        cartViewModel.updateQuantity(for: item.product, quantity: 0)
                    }) {
                        Text("Remove")
                            .font(.caption)
                            .foregroundColor(.blue)
                    }
                }
                Spacer()

                // Stepper for quantity
                HStack(spacing: 10) {
                    Button(action: {
                        if item.quantity > 1 {
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

