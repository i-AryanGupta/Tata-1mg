//
//  OrderPageView.swift
//  Tata 1mg
//
//  Created by Yashom on 26/10/24.
//

import SwiftUI

struct OrderPageView: View {
    var orderedItems: [CartItem]
    var totalPrice: Double
    var deliveryDate: String
    var onDisappear: (() -> Void)?  // Closure to trigger cart clearing

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Order Summary")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 10)

            ScrollView {
                ForEach(orderedItems) { item in
                    HStack(alignment: .top, spacing: 15) {
                        Image(item.product.productImages.first ?? "defaultImage")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .cornerRadius(8)

                        VStack(alignment: .leading, spacing: 5) {
                            Text(item.product.productName)
                                .font(.headline)

                            Text("Quantity: \(item.quantity)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            Text("₹\(String(format: "%.2f", item.product.productDiscountedPrice))")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                    Divider()
                }
            }

            HStack {
                Image(systemName: "calendar")
                    .foregroundColor(.blue)
                VStack(alignment: .leading) {
                    Text("Expected Delivery")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(deliveryDate)
                        .font(.headline)
                        .foregroundColor(.blue)
                }
            }
            .padding(.vertical)

            HStack {
                Text("Price Paid")
                    .font(.headline)
                Spacer()
                Text("₹\(String(format: "%.2f", totalPrice))")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
            }
            .padding(.vertical)

            Spacer()
        }
        .padding()
        .navigationTitle("Order Confirmation")
        .navigationBarTitleDisplayMode(.inline)
        .onDisappear {
            onDisappear?()  // Trigger cart clearing on view exit
        }
    }
}


struct OrderPageView_Previews: PreviewProvider {
    static var previews: some View {
        // Sample data for preview
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

        let orderedItems = [
            CartItem(product: sampleProduct1, quantity: 2),
            CartItem(product: sampleProduct2, quantity: 1)
        ]

        return OrderPageView(orderedItems: orderedItems, totalPrice: 290.00, deliveryDate: "26 - 28 October")
            .previewLayout(.sizeThatFits)
    }
}

