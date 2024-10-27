//
//  Product.swift
//  Tata 1mg
//
//  Created by Yashom on 27/10/24.
//

import Foundation

struct Product: Identifiable, Codable {
    var id: UUID = UUID() // Unique identifier for each product
    let productName: String
    let productImages: [String]
    let productPrice: Double
    let productDiscountedPrice: Double
    let deliveryDate: String
    let productType: String
    let productInformation: String

    // Define CodingKeys to match JSON keys if needed
    private enum CodingKeys: String, CodingKey {
        case productName
        case productImages
        case productPrice
        case productDiscountedPrice
        case deliveryDate
        case productType
        case productInformation
    }
}
