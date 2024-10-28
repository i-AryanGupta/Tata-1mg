//
//  PopUpView.swift
//  Tata 1mg
//
//  Created by Yashom on 21/10/24.
//

import SwiftUI

struct PopupView: View {
    @Binding var isPresented: Bool
    @EnvironmentObject var cartViewModel: CartViewModel // Use as EnvironmentObject
    var product: ProductCellData
    let options: [String]

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Select an Option")
                    .font(.headline)

                ForEach(options, id: \.self) { option in
                    Button(action: {
                        let selectedQuantity = Int(option) ?? 1
                        cartViewModel.updateQuantity(for: product.id, quantity: selectedQuantity)
                        isPresented = false // Close the popup
                    }) {
                        HStack {
                            Text(option)
                                .padding()
                            Spacer()
                            Image(systemName: cartViewModel.quantity(for: product.id) == Int(option) ? "checkmark.circle.fill" : "plus.circle")
                                .foregroundColor(cartViewModel.quantity(for: product.id) == Int(option) ? .orange : .black)
                        }
                        .background(cartViewModel.quantity(for: product.id) == Int(option) ? .orange.opacity(0.2) : .white)
                    }
                }

                Button("Clear Products") {
                    cartViewModel.updateQuantity(for: product.id, quantity: 0)
                    isPresented = false
                }
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(5)
            }
            .padding()
        }
    }
}

