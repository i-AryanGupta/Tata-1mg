//
//  BillSummaryView.swift
//  Tata 1mg
//
//  Created by Yashom on 24/10/24.
//

import SwiftUI

struct BillSummaryView: View {
    var totalPrice: Double
    var totalSavings: Double

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Bill summary")
                .font(.headline)
                .padding(.bottom, 10)
            
            HStack {
                Text("Item total (MRP)")
                Spacer()
                Text("₹\(String(format: "%.2f", totalPrice+totalSavings))")
            }

            HStack {
                Text("Green packaging charge")
                Spacer()
                Text("₹0")
            }

            HStack {
                Text("Neucoins used")
                    .foregroundColor(.green)
                Spacer()
                Text("-₹0")
            }

            HStack {
                Text("Total discount")
                Spacer()
                Text("-₹\(String(format: "%.2f", totalSavings))")
            }

            HStack {
                Text("Shipping fee")
                Spacer()
                Text("Free")
                    .foregroundColor(.green)
            }
            
            Divider()
                .padding(.vertical)

            HStack {
                Text("To be paid")
                    .font(.title3)
                    .fontWeight(.bold)
                Spacer()
                Text("₹\(String(format: "%.2f", totalPrice))") // Subtract Neucoins, add Green packaging
                    .font(.title3)
                    .fontWeight(.bold)
            }

            HStack {
                Image(systemName: "tag.fill")
                    .foregroundColor(.green)
                Text("You have saved ₹\(String(format: "%.2f", totalSavings)) on this order")
                    .foregroundColor(.green)
            }
            .padding(.top, 10)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
    }
}

struct BillSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        BillSummaryView(totalPrice: 980.99, totalSavings: 245.00)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

