//
//  ProductBasedOnCategory.swift
//  Tata 1mg
//
//  Created by Yashom on 25/10/24.
//

import SwiftUI

import SwiftUI

struct ProductBasedOnCategory: View {
    var products: [ProductCellData]

    var body: some View {
        VStack(spacing: 10) {
            ForEach(products) { product in
                HStack {
                    Image(product.productImages.first ?? "defaultImage")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(8)

                    VStack(alignment: .leading, spacing: 5) {
                        Text(product.productName)
                            .font(.headline)
                        
                        Text(product.productType)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Text("Get by \(product.deliveryDate)")
                            .font(.subheadline)
                            .foregroundColor(.gray)

                        HStack {
                            Text("₹\(String(format: "%.2f", product.productDiscountedPrice))")
                                .fontWeight(.bold)
                                .font(.subheadline)
                            
                            Text("₹\(String(format: "%.2f", product.productPrice))")
                                .strikethrough()
                                .font(.subheadline)
                                .foregroundColor(.gray)

                            Text("\(Int((product.productPrice - product.productDiscountedPrice) / product.productPrice * 100))% off")
                                .foregroundColor(.green)
                                .fontWeight(.bold)
                                .font(.subheadline)
                        }
                    }

                    Spacer()

                    Button(action: {
                        // Add to Cart action
                    }) {
                        Text("ADD")
                            .foregroundColor(.red)
                            .padding(10)
                            .background(Color.white)
                            .cornerRadius(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    }
                }
                .padding(.vertical, 8)
                Divider()
            }
        }
        .padding(.horizontal)
    }
}


struct ProductBasedOnCategory_Previews: PreviewProvider {
    static var previews: some View {
        let sampleProducts = [
            ProductCellData(
                productName: "Otrivin Oxy Fast Relief Adult Nasal Spray",
                productImages: ["nasal_spray"],
                productPrice: 117.13,
                productDiscountedPrice: 105.00,
                productType: "Nasal Drops & Sprays",
                productInformation: "Nasal spray for fast relief from nasal congestion."
            ),
            ProductCellData(
                productName: "Vicks Vaporub Balm",
                productImages: ["vicks_vaporub"],
                productPrice: 199.00,
                productDiscountedPrice: 191.00,
                productType: "Chest Rubs & Balms",
                productInformation: "Relieves cough and cold symptoms."
            )
        ]

        ProductBasedOnCategory(products: sampleProducts)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

