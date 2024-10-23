//
//  CartViewModel.swift
//  Tata 1mg
//
//  Created by Yashom on 23/10/24.
//

import Foundation
class CartViewModel: ObservableObject {
    @Published var cartItems: [CartItem] = []
    
    // Add product to cart
    func addToCart(product: ProductCellData) {
        if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
            cartItems[index].quantity += 1
        } else {
            cartItems.append(CartItem(product: product, quantity: 1))
        }
    }
    
    // Update quantity of a cart item
    func updateQuantity(for product: ProductCellData, quantity: Int) {
        if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
            cartItems[index].quantity = quantity
            if quantity == 0 {
                cartItems.remove(at: index)
            }
        }
    }
    
    // Calculate total price
    var totalPrice: Double {
        cartItems.reduce(0) { $0 + ($1.product.productDiscountedPrice * Double($1.quantity)) }
    }
}


