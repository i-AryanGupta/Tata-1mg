//
//  SingleProductCellForCategory.swift
//  Tata 1mg
//
//  Created by Yashom on 25/10/24.
//

import SwiftUI

struct SingleDataCell: View {
    @EnvironmentObject var cartViewModel: CartViewModel // Use shared CartViewModel
    var product: ProductCellData
    @State private var showProductPage = false
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
                    Text("₹\(Int(product.productDiscountedPrice))")
                        .fontWeight(.bold)
                        .font(.subheadline)
                    
                    Text("₹\(Int(product.productPrice))")
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
                    showCart = true
                }) {
                    let quantity = cartViewModel.quantity(for: product.id)
                    Text(quantity > 0 ? "\(quantity) added" : "ADD")
                        .foregroundColor(quantity > 0 ? .white : .red)
                        .padding(10)
                        .frame(maxWidth: .infinity)
                        .background(quantity > 0 ? Color.orange : Color.white)
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
        .bgNavLink(content: ProductPageView(productViewModel: ProductViewModel(product: product)), isAction: $showProductPage)
        .environmentObject(cartViewModel) // Pass cartViewModel down to ProductPageView
        Divider()
    }
}




//struct SingleDataCell_Previews: PreviewProvider {
//    static var previews: some View {
//        let sampleProduct = ProductCellData(
//            productName: "Azithromycin",
//            productImages: ["pills1"],
//            productPrice: 150.00,
//            productDiscountedPrice: 100.00,
//            deliveryDate: "11-12",
//            productType: "Medicine",
//            productInformation: "Antibiotic used to treat bacterial infections."
//        )
//
//        SingleDataCell(cartViewModel: CartViewModel(), product: sampleProduct, showCart: .constant(false))
//            .previewLayout(.sizeThatFits)
//            .padding()
//    }
//}


