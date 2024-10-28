//
//  CartViewModel.swift
//  Tata 1mg
//
//  Created by Yashom on 23/10/24.
//

import SwiftUI

class CartViewModel: ObservableObject {
    @Published var cartItems: [CartItem] = []
    let products: [ProductCellData] 


    init(products: [ProductCellData]) {
        self.products = products
    }

    var totalSavings: Double {
        cartItems.reduce(0) { $0 + ($1.product.productPrice - $1.product.productDiscountedPrice) * Double($1.quantity) }
    }

    func quantity(for productID: String) -> Int {
        cartItems.first(where: { $0.product.id == productID })?.quantity ?? 0
    }

    func addToCart(product: ProductCellData) {
        if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
            cartItems[index].quantity += 1
        } else {
            cartItems.append(CartItem(product: product, quantity: 1))
        }
    }

    func updateQuantity(for productID: String, quantity: Int) {
        if let index = cartItems.firstIndex(where: { $0.product.id == productID }) {
            if quantity == 0 {
                cartItems.remove(at: index)
            } else {
                cartItems[index].quantity = quantity
            }
        } else if quantity > 0 {
            if let product = fetchProduct(by: productID) {
                cartItems.append(CartItem(product: product, quantity: quantity))
            }
        }
    }

    private func fetchProduct(by productID: String) -> ProductCellData? {
        let foundProduct = products.first(where: { $0.id == productID })
        print("fetchProduct found product: \(foundProduct?.productName ?? "nil") for ID: \(productID)")
        return foundProduct
    }

    var totalPrice: Double {
        cartItems.reduce(0) { $0 + ($1.product.productDiscountedPrice * Double($1.quantity)) }
    }

    func getCartSnapshot() -> [CartItem] {
        return cartItems
    }

    func clearCart() {
        cartItems.removeAll()
    }
}
