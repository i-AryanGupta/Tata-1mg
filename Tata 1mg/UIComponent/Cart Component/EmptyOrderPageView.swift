//
//  EmptyOrderPageView.swift
//  Tata 1mg
//
//  Created by Yashom on 26/10/24.
//

import SwiftUI

struct EmptyOrderPageView: View {
    var body: some View {
        VStack {
            Image(systemName: "cart.fill.badge.plus")
                .resizable()
                .frame(width: 120, height: 100)
                .foregroundColor(.orange)
                .padding(.bottom, 10)
            
            Text("No Orders Found")
                .font(.title)
                .foregroundColor(.black)
            
            Text("Your cart is currently empty. Add products to view them here.")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
        }
        .padding()
        .navigationTitle("Order Confirmation")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct EmptyOrderPageView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyOrderPageView()
    }
}
