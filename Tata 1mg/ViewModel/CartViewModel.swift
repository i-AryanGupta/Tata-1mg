//
//  CartViewModel.swift
//  Tata 1mg
//
//  Created by Yashom on 23/10/24.
//

import Foundation
class CartViewModel: ObservableObject {
    @Published var cartItems: [CartItem] = []
    
    var totalSavings: Double {
            cartItems.reduce(0) { $0 + ($1.product.productPrice - $1.product.productDiscountedPrice) * Double($1.quantity) }
        }
    
    // Add or update product in cart
    func addToCart(product: ProductCellData) {
        if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
            cartItems[index].quantity += 1
        } else {
            cartItems.append(CartItem(product: product, quantity: 1))
        }
    }
    
    // Update product quantity in cart
    func updateQuantity(for product: ProductCellData, quantity: Int) {
        if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
            cartItems[index].quantity = quantity
            if quantity == 0 {
                cartItems.remove(at: index)
            }
        } else if quantity > 0 {
            cartItems.append(CartItem(product: product, quantity: quantity))
        }
    }
    
    // Calculate total price
    var totalPrice: Double {
        cartItems.reduce(0) { $0 + ($1.product.productDiscountedPrice * Double($1.quantity)) }
    }
}


