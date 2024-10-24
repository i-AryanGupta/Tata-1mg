//
//  CartView.swift
//  Tata 1mg
//
//  Created by Yashom on 23/10/24.
//


import SwiftUI

struct CartView: View {
    @ObservedObject var cartViewModel: CartViewModel
    let productsFile = ProductsFile()
    
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
                // Additional Product Sections (below DetailCart)
                VStack(alignment: .leading) {
                    // Wellness Products Section
                    Text("Last Minute Buy")
                        .font(.headline)
                        .padding(.leading, 5)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            productStack(for: "Wellness")
                        }
                        .padding(.leading, 5)
                    }

                    // Medicine Products Section
                    Text("Medicine Products")
                        .font(.headline)
                        .padding(.leading, 5)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            productStack(for: "Medicine")
                        }
                        .padding(.leading, 5)
                    }
                }
                .padding(.horizontal)
                
                BillSummaryView(totalPrice: cartViewModel.totalPrice, totalSavings: cartViewModel.totalSavings)
                
                BottomImage()
                            
            }
            CartBottomBarView(totalPrice: cartViewModel.totalPrice)
            .padding(.top, 10)
        }
        .padding(.horizontal)
    }
    
    // Function to filter and display products by type, similar to HomePageView
    func productStack(for type: String) -> some View {
        let filteredProducts = productsFile.productCellData.filter { $0.productType == type }
        
        return ForEach(filteredProducts) { product in
            ProductCellDataReusable(cartViewModel: cartViewModel, product: product)
        }
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

