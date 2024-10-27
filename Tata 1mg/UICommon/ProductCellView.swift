//
//  ProductCellView.swift
//  Tata 1mg
//
//  Created by Yashom on 27/10/24.
//

import SwiftUI

struct ProductCellView: View {
    let product: Product

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Display the first image (assuming the productImages array has image names)
            HStack{
                Image(product.productImages.first ?? "defaultImage") // Use a placeholder if image is unavailable
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(8)
                
                VStack(alignment: .leading, spacing: 4) {
                    // Product name with a bold font style
                    Text(product.productName)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .lineLimit(1)
                        .foregroundColor(.primary)
                    
                    // Product type and delivery date in a smaller font and gray color
                    Text(product.productType)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text("Get it by \(product.deliveryDate)")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    
                    // Price details in HStack for better alignment and spacing
                    HStack(spacing: 5) {
                        Text("₹\(Int(product.productDiscountedPrice))") // Discounted price
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                        
                        Text("₹\(Int(product.productPrice))") // Original price with strikethrough
                            .strikethrough()
                            .font(.footnote)
                            .foregroundColor(.gray)
                        
                        Text("\(calculateDiscount())% off")
                            .font(.footnote)
                            .foregroundColor(.red)
                    }
                }
                
            }

            // Product information
            Text(product.productInformation)
                .font(.body)
                .foregroundColor(.secondary)
            
            CustomButton(title: "Add"){
                
            }
            
            
        }
        .padding()
        .background(Color.white)
        .padding(.vertical, 4)
        Divider()
    }
    private func calculateDiscount() -> Int {
            let discount = ((product.productPrice - product.productDiscountedPrice) / product.productPrice) * 100
            return Int(discount)
        }
}

struct ProductCellView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCellView(
            product: Product(
                productName: "Azithromycin",
                productImages: ["azit1", "azit2", "azit1"],
                productPrice: 150.30,
                productDiscountedPrice: 100.00,
                deliveryDate: "Delivery by 11pm today",
                productType: "Medicine",
                productInformation: "Azithromycin is a widely used antibiotic for bacterial infections."
            )
        )
        .previewLayout(.sizeThatFits)
        .padding()
    }
}

