//
//  ProductBasedOnCategory.swift
//  Tata 1mg
//
//  Created by Yashom on 25/10/24.
//

import SwiftUI

struct ProductBasedOnCategory: View {
    var products: [ProductCellData]
    @ObservedObject var cartViewModel: CartViewModel
    @Binding var showCart: Bool // Add this binding

    var body: some View {
        VStack(spacing: 10) {
            ForEach(products) { product in
                SingleDataCell(cartViewModel: cartViewModel, product: product, showCart: $showCart) // Pass the binding
            }
        }
        .padding(.horizontal)
    }
}




struct ProductBasedOnCategory_Previews: PreviewProvider {
    static var previews: some View {
        let sampleProducts = [
            ProductCellData(
                productName: "Azithromycin",
                productImages: ["pills1"],
                productPrice: 150.00,
                productDiscountedPrice: 100.00,
                productType: "Medicine",
                productInformation: "Antibiotic used to treat bacterial infections."
            ),
            ProductCellData(
                productName: "Vicks Vaporub",
                productImages: ["vicks_vaporub"],
                productPrice: 120.00,
                productDiscountedPrice: 100.00,
                productType: "Wellness",
                productInformation: "Provides temporary relief from cough and cold symptoms."
            )
        ]
        
        ProductBasedOnCategory(products: sampleProducts, cartViewModel: CartViewModel(), showCart: .constant(false))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}



