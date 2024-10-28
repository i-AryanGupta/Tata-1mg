//
//  CartView.swift
//  Tata 1mg
//
//  Created by Yashom on 23/10/24.
//


import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartViewModel: CartViewModel // Shared CartViewModel instance

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

            ScrollView {
                // Cart Items List
                VStack {
                    ForEach(cartViewModel.cartItems) { item in
                        CartItemView(item: item)
                            .id(item.id)
                    }
                }

                // Apply Coupon Section
                Button(action: applyCoupon) {
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

                // DetailCart and Additional Products
                DetailCart()

                VStack(alignment: .leading) {
                    Text("Last Minute Buy")
                        .font(.headline)
                        .padding(.leading, 5)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            productStack(for: "Wellness")
                        }
                        .padding(.leading, 5)
                    }

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

                // Bill Summary
                BillSummaryView(totalPrice: cartViewModel.totalPrice, totalSavings: cartViewModel.totalSavings)

                BottomImage()
            }

            // Cart Bottom Bar View
            CartBottomBarView(totalPrice: cartViewModel.totalPrice)
                .padding(.top, 10)
        }
        .padding(.horizontal)
    }

    // Function to filter and display products by type, similar to HomePageView
    func productStack(for type: String) -> some View {
        let filteredProducts = cartViewModel.products.filter { $0.productType == type }
        return ForEach(filteredProducts) { product in
            ProductCellDataReusable(product: product)
                .environmentObject(cartViewModel)
                .id(product.id)
        }
    }

    private func applyCoupon() {
        print("Coupon applied")
    }
}


// Preview
//struct CartView_Previews: PreviewProvider {
//    static var previews: some View {
//        let sampleCartViewModel = CartViewModel()
//
//        let sampleProduct1 = ProductCellData(
//            productName: "Azithromycin",
//            productImages: ["azit1"],
//            productPrice: 150.30,
//            productDiscountedPrice: 100.00,
//            deliveryDate: "11-12",
//            productType: "Medicine",
//            productInformation: "Azithromycin is a commonly used antibiotic for treating bacterial infections."
//        )
//        let sampleProduct2 = ProductCellData(
//            productName: "Paracetamol",
//            productImages: ["pills1"],
//            productPrice: 120.00,
//            productDiscountedPrice: 90.00,
//            deliveryDate: "11-12",
//            productType: "Medicine",
//            productInformation: "Paracetamol is used for pain relief and fever reduction."
//        )
//
//        sampleCartViewModel.addToCart(product: sampleProduct1)
//        sampleCartViewModel.addToCart(product: sampleProduct2)
//
//        return CartView(cartViewModel: sampleCartViewModel)
//            .previewLayout(.sizeThatFits)
//            .padding()
//    }
//}
