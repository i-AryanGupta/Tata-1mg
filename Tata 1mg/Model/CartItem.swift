//
//  CartItem.swift
//  Tata 1mg
//
//  Created by Yashom on 23/10/24.
//

import Foundation

struct CartItem: Identifiable {
    var id: String = UUID().uuidString
    var product: ProductCellData
    var quantity: Int
}
