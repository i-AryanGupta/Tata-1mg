//
//  SingleProductCellForCategory.swift
//  Tata 1mg
//
//  Created by Yashom on 25/10/24.
//

import SwiftUI

struct SingleDataCell: View {
    @ObservedObject var cartViewModel: CartViewModel
    var product: ProductCellData
    @State private var showProductPage = false
    @State private var isAdded = false
    @Binding var showCart: Bool

    var body: some View {
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
                
                // Price, Discounted Price, and Off Percentage in the same line
                HStack {
                    Text("₹\(Int(product.productDiscountedPrice))") // Removing decimal points
                        .fontWeight(.bold)
                        .font(.subheadline)
                    
                    Text("₹\(Int(product.productPrice))") // Removing decimal points
                        .strikethrough()
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    Text("\(Int((product.productPrice - product.productDiscountedPrice) / product.productPrice * 100))% off")
                        .foregroundColor(.green)
                        .fontWeight(.bold)
                        .font(.subheadline)
                }

                // Add Button below the price line
                Button(action: {
                    cartViewModel.addToCart(product: product)
                    isAdded = true
                    showCart = true
                }) {
                    Text(isAdded ? "Added" : "ADD")
                        .foregroundColor(isAdded ? .white : .red)
                        .padding(10)
                        .frame(maxWidth: .infinity)
                        .background(isAdded ? Color.orange : Color.white)
                        .cornerRadius(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }
            }

            Spacer()
        }
        .padding(.vertical, 8)
        .onTapGesture {
            showProductPage = true // Navigate to ProductPageView
        }
        .bgNavLink(content: ProductPageView(cartViewModel: cartViewModel, productViewModel: ProductViewModel(product: product)), isAction: $showProductPage)
        Divider()
    }
}



struct SingleDataCell_Previews: PreviewProvider {
    static var previews: some View {
        let sampleProduct = ProductCellData(
            productName: "Azithromycin",
            productImages: ["pills1"],
            productPrice: 150.00,
            productDiscountedPrice: 100.00,
            productType: "Medicine",
            productInformation: "Antibiotic used to treat bacterial infections."
        )

        SingleDataCell(cartViewModel: CartViewModel(), product: sampleProduct, showCart: .constant(false))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}


