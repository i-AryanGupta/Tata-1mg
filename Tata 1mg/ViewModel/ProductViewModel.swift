//
//  ProductViewModel.swift
//  Tata 1mg
//
//  Created by Yashom on 24/10/24.
//

import Foundation

class ProductViewModel: ObservableObject {
    @Published var product: ProductCellData
    
    init(product: ProductCellData) {
        self.product = product
    }
}
