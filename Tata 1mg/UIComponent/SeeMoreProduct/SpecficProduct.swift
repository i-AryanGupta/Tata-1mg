//
//  SpecficProduct.swift
//  Tata 1mg
//
//  Created by Yashom on 25/10/24.
//

import SwiftUI

struct SpecificProductCell: View {
    var data: String
    var image: String
    
    var body: some View {
        VStack(spacing: 0) {
                VStack() {
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .padding(3)
                        .cornerRadius(15)
                }
                .frame(width: 80, height: 80)
                .padding(5)
                .background(Color.orange.opacity(0.3))
                .cornerRadius(12)
                
                
                Text(data)
                    .foregroundColor(.black)
                    .font(.caption)
                    .padding(.top, 15)
            }
        .frame(width: 95, height: 140)
        .cornerRadius(15)
    }
}

struct SpecificProductCell_Previews: PreviewProvider {
    static var previews: some View {
        SpecificProductCell(data: "Stomach Care", image: "pills1")
    }
}
