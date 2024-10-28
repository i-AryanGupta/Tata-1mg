//
//  JasonLoader.swift
//  Tata 1mg
//
//  Created by Yashom on 27/10/24.
//

import Foundation

import Foundation

struct JSONLoader {
    static func loadProductData() -> [ProductCellData] {
        // Locate the JSON file in the main bundle
        guard let url = Bundle.main.url(forResource: "ProductsData", withExtension: "json") else {
            print("JSON file not found")
            return []
        }

        do {
            // Load the data from the file
            let data = try Data(contentsOf: url)
            
            // Decode using the wrapper struct to handle the nested structure
            let productDataWrapper = try JSONDecoder().decode(ProductDataWrapper.self, from: data)
            
            // Return the array of ProductCellData
            return productDataWrapper.productCellData
        } catch {
            print("Error decoding JSON:", error)
            return []
        }
    }
}




