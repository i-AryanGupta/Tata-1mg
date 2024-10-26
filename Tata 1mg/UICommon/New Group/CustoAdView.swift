//
//  CustoAddView.swift
//  Tata 1mg
//
//  Created by Yashom on 25/10/24.
//

import SwiftUI

struct CustomAdView: View {
    let imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 375,height: 200)
            .clipped()
            .padding(.leading, 10)
            .padding(.trailing, 10)
    }
}

struct CustomAdView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAdView(imageName: "tata_ad")
    }
}
