//
//  PopUpView.swift
//  Tata 1mg
//
//  Created by Yashom on 21/10/24.
//

import SwiftUI

struct PopupView: View {
    @Binding var addedProducts: Int
    @Binding var isPresented: Bool
    @State var isSelected : Bool = false
    let options: [String]

    var body: some View {
        ScrollView{
            VStack(spacing: 20) {
                Text("Select an Option")
                    .font(.headline)
                
                ForEach(options, id: \.self) { option in
                    Button(action: {
                        selectProduct(option)
                        isPresented = false
                        
                    }) {
                        HStack{
                            Text(option)
                                //.frame(maxWidth: .infinity)
                                .padding()
                               // .background(Color.blue)
                               // .foregroundColor(.white)
                                .cornerRadius(5)
                            
                            Spacer()
                            Image(systemName: addedProducts == Int(option) ? "checkmark.circle.fill":"plus.circle")
                                .foregroundColor(addedProducts == Int(option) ? .orange : .black)
                        }
                        .background(addedProducts == Int(option) ? .orange.opacity(0.2) : .white)
                       
                    }
                }
                
                Button("Clear Products") {
                    addedProducts = 0 // Clear the selected products
                    isPresented = false // Dismiss the popup
                }
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(5)
            }
            .padding()
        }
    }

    private func selectProduct(_ product: String) {
        addedProducts = Int(product) ?? 10
        isSelected = true
    }
}
