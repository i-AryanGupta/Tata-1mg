//
//  ProductCellData.swift
//  Tata 1mg
//
//  Created by Yashom on 21/10/24.
//

import SwiftUI

struct ProductCellDataReusable: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    var product: ProductCellData
    @State private var showPopup = false
    @State private var showProductPage = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Image(product.productImages.first ?? "defaultImage")
                    .resizable()
                    .scaledToFit()
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
            .onTapGesture {
                showProductPage = true
            }
            .bgNavLink(
                content: ProductPageView(productViewModel: ProductViewModel(product: product)),
                isAction: $showProductPage
            )

            if showPopup {
                popupOverlay
            }
        }
    }
    
    private var productDetails: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(product.productName)
                .fontWeight(.bold)
                .padding(.leading, 5)
            
            Text("20 tablets")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.leading, 5)
            
            Text(product.productInformation ?? "")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.leading, 5)
        }
    }
    
    private var priceDetails: some View {
        HStack {
            Text("\u{20B9} \(String(format: "%.2f", product.productDiscountedPrice))")
                .fontWeight(.bold)
                .font(.subheadline)
                .padding(.leading, 5)
            
            Text("\(Int((product.productPrice - product.productDiscountedPrice) / product.productPrice * 100))% off")
                .foregroundColor(.green)
                .fontWeight(.bold)
                .font(.subheadline)
                .padding(.leading, 5)
        }
    }
    
    private func addButton() -> some View {
        let quantity = cartViewModel.quantity(for: product.id)
        
        return Button(action: {
            showPopup = true
        }, label: {
            if quantity > 0 {
                Text("\(quantity) added")
                    .foregroundColor(.white)
                    .frame(width: 169, height: 40)
                    .background(Color.orange)
                    .cornerRadius(10)
            } else {
                Text("ADD")
                    .foregroundColor(Color.btnCellText)
                    .bold()
                    .frame(width: 169, height: 40)
                    .background(Color.btnBGCell)
                    .cornerRadius(10)
            }
        })
        .padding(5)
    }
    
    private var popupOverlay: some View {
        ZStack {
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
            
            PopupView(
                isPresented: $showPopup,
                product: product,
                options: ["1", "2", "3"]
            )
            .environmentObject(cartViewModel) // Provide the environment object here
            .frame(width: 300, height: 350)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 20)
        }
    }
}
