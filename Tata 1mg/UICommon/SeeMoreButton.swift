//
//  SeeMoreButton.swift
//  Tata 1mg
//
//  Created by Yashom on 27/10/24.
//

import SwiftUI

struct SeeMoreButton: View {
    @State private var seeMore = false

    var body: some View {
        HStack {
            Button {
                seeMore = true
            } label: {
                Text("See More")
                    .foregroundColor(Color.orange)
                    .font(.headline)
            }
        }
        .bgNavLink(content: ProductJsonFetchView(), isAction: $seeMore) // Pass cartViewModel here
    }
}


//struct SeeMoreButton_Previews: PreviewProvider {
//    static var previews: some View {
//        SeeMoreButton(cartViewModel: cartViewModel)
//    }
//}
