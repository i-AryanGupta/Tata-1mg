//
//  GetCarePlanView.swift
//  Tata 1mg
//
//  Created by Yashom on 27/10/24.
//

import SwiftUI

struct GetCarePlanView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.orange.opacity(0.1), Color.white]), startPoint: .top, endPoint: .bottom)
            Image("careplan")
                .resizable()
                .scaledToFit()
        }
        .ignoresSafeArea()
    }
}

struct GetCarePlanView_Previews: PreviewProvider {
    static var previews: some View {
        GetCarePlanView()
    }
}
