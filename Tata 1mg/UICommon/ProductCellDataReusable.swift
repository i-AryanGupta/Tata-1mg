//
//  ProductCellData.swift
//  Tata 1mg
//
//  Created by Yashom on 21/10/24.
//

import SwiftUI

struct ProductCellDataReusable: View {
    var didAddCart: (() -> ())?
    var image = "pill"
    var name = "Paracetamol"
    var price = "190.00"
    var delivery = "delivery by 11 pm"
    @State var addedProducts = 0
    @State var switchButton = false
    @State var showPopup = false
    let options = ["1", "2", "3"]
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 140, height: 140)
                    .clipped()
                    .cornerRadius(15)
                    .padding(.top, 3)
                
                VStack(alignment: .leading, spacing: 4) {
                    productDetails
                    priceDetails
                    
                    addButton()
                }
                .shadow(radius: 2)
            }
            .frame(width: 180, height: 290)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.gray.opacity(0.8))
            )
            
            if showPopup {
                popupOverlay
            }
        }
    }
    
    // Product details subview
    private var productDetails: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(name)
                .fontWeight(.bold)
                .padding(.leading, 5)
            
            Text("20 tablets")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.leading, 5)
            
            Text("Paracetamol")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.leading, 5)
        }
    }
    
    // Price details subview
    private var priceDetails: some View {
        HStack {
            Text("\u{20B9} \(price)")
                .fontWeight(.bold)
                .font(.subheadline)
                .padding(.leading, 5)
            
            Text("30% off")
                .foregroundColor(.green)
                .fontWeight(.bold)
                .font(.subheadline)
                .padding(.leading, 5)
        }
    }
    
    // Add to cart button
    private func addButton() -> some View {
        Button(action: {
            didAddCart?()
            addedProducts += 1
            if addedProducts > 0 {
                withAnimation(.easeIn(duration: 2)) {
                    switchButton = true
                }
            }
        }, label: {
            if addedProducts > 0 {
                addedProductButton(title: "\(addedProducts) added") {
                    showPopup = true
                }
                .frame(width: 169, height: 40)
            } else {
                Text("Add")
                    .foregroundColor(Color.btnCellText)
                    .bold()
                    .frame(width: 169, height: 40)
            }
        })
        .background(Color.btnBGCell)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 3, x: 0, y: 5)
        .padding(5)
    }
    
    // Popup overlay for quantity selection
    private var popupOverlay: some View {
        ZStack {
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
            
            PopupView(addedProducts: $addedProducts, isPresented: $showPopup, options: options)
                .frame(width: 300, height: 350)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 20)
        }
    }
}

struct ProductCellDataReusable_Previews: PreviewProvider {
    static var previews: some View {
        ProductCellDataReusable()
    }
}
