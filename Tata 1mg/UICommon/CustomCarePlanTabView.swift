//
//  CustomCarePlanTabView.swift
//  Tata 1mg
//
//  Created by Yashom on 27/10/24.
//

import SwiftUI

struct CustomCarePlanTabView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [.red, .white]), startPoint: .top, endPoint: .bottom))
                .frame(width: 30, height: 30) // Adjust size to fit tab bar
            
            Image("GetCareplan")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
        }
    }
}

struct CustomCarePlanTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCarePlanTabView()
    }
}
