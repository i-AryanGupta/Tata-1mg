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
                        VStack() {
                            Image("vivks1")
                                .resizable()
                                .scaledToFit()
                                .padding(3)
                                .cornerRadius(15)
                        
                        //.background(Color.orange.opacity(0.3))
                        
                        Text(category)
                                .font(.headline)
                                .font(.system(size: 5))
                            .foregroundColor(selectedCategory == category ? .blue : .black)
                        
                        Spacer()
                    }
                        .frame(width: 80, height: 120)
                    .background(selectedCategory == category ? Color.orange.opacity(0.4) : Color.clear)
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
        SideBarProductType(categories: ["Medicine", "Wellness"], selectedCategory: .constant("Medicine"))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}


