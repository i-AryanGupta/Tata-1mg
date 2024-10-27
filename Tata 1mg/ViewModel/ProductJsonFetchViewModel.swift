//
//  ProductJsonFetchViewModel.swift
//  Tata 1mg
//
//  Created by Yashom on 27/10/24.
//

import SwiftUI


class ProductJsonFetchViewModel: ObservableObject {
    @Published var products: [Product] = []
    
    init() {
        loadProducts()
    }
    
    func loadProducts() {
        guard let url = Bundle.main.url(forResource: "Products", withExtension: "json") else {
            print("Failed to locate Products.json in bundle.")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decodedProducts = try JSONDecoder().decode([Product].self, from: data)
            self.products = decodedProducts
            print("Successfully loaded \(products.count) products.")
        } catch {
            print("Failed to decode Products.json: \(error.localizedDescription)")
        }
    }
}
