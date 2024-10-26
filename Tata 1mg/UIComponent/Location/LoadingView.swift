//
//  LoadingView.swift
//  Tata 1mg
//
//  Created by Yashom on 26/10/24.
//

import SwiftUI

struct LoadingView: View {
    var selectedCity: String
    
    var body: some View {
        ZStack {
            Image("map")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                ProgressView()
                Text("Delivering to")
                    .foregroundColor(.gray)
                    .bold()
                Text(selectedCity)
                    .font(.title)
                    .bold()
            }
            .padding()
            .background(Color.white.opacity(0.8))
            .cornerRadius(10)
        }
    }
}

