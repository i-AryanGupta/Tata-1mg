//
//  SideBarProductType.swift
//  Tata 1mg
//
//  Created by Yashom on 25/10/24.
//

import SwiftUI

struct SideBarProductType: View {
    var categories: [String]
    @Binding var selectedCategory: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(categories, id: \.self) { category in
                Button(action: {
                    selectedCategory = category
                }) {
                    HStack {
                        Text(category)
                            .font(.headline)
                            .foregroundColor(selectedCategory == category ? .blue : .black)
                        
                        Spacer()
                    }
                    .padding()
                    .background(selectedCategory == category ? Color.blue.opacity(0.2) : Color.clear)
                    .cornerRadius(10)
                }
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}


struct SideBarProductType_Previews: PreviewProvider {
    static var previews: some View {
        SideBarProductType(categories: ["Nasal Drops & Sprays", "Chest Rubs & Balms", "Cough Syrups"], selectedCategory: .constant("Nasal Drops & Sprays"))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

