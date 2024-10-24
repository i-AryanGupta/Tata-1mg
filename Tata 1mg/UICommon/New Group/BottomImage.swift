//
//  BottomImage.swift
//  Tata 1mg
//
//  Created by Yashom on 24/10/24.
//

import SwiftUI

struct BottomImage: View {
    var body: some View {
        VStack{
            Text("Adding some Sunsine to your life")
                .bold()
                .font(.system(size: 60))
                .foregroundStyle(LinearGradient(colors: [Color.orange, Color.purple], startPoint: .leading, endPoint: .trailing))
            
            Image("tata_1mg_logo")
                .resizable()
                .scaledToFit()
                .frame(width:200,height: 80,alignment: .leading)
                .clipped()
                .cornerRadius(30)
            
        }
        .frame(width: 380, height: 480)
        .background(.pink.opacity(0.1))
    }
}

struct BottomImage_Previews: PreviewProvider {
    static var previews: some View {
        BottomImage()
    }
}
