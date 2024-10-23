//
//  TopSelfSection.swift
//  Tata 1mg
//
//  Created by Yashom on 22/10/24.
//

import SwiftUI

struct TopSelfSection: View {
    @State var images = ["pills1","azit1","azit2","azit3","mama","move1"]
        @State var index = 0
        @State private var timer: Timer?
        @State var animate = false
        var body: some View {
            HStack{
                
                    RoundedRectangle(cornerRadius: 15)
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.red, Color.pink]), startPoint: .topTrailing, endPoint: .bottomLeading))
                        .overlay(
                            HStack{
                                VStack(alignment:.leading){
                                    Text("Pharmacy")
                                        .bold()
                                    Text("100% genuine")
                                        .font(.callout)
                                }
                                Spacer()
                                
                                Image(images[index])
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(15)
                            }
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(8),
                                 alignment: .topLeading
                            
                                        )
                
                
                RoundedRectangle(cornerRadius: 15)
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.teal]), startPoint: .topTrailing, endPoint: .bottomLeading))
                    .overlay(
                        HStack{
                            VStack(alignment:.leading){
                                Text("Labs")
                                    .bold()
                                Text("Smart Reports")
                                    .font(.callout)
                            }
                            Spacer()
                            HStack{
                                Image(images[index])
                                    .resizable()
                                    .cornerRadius(15)
                                    .frame(width: animate ? 0 : 80)
                            }
                            
                                
                            
                        }
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(8),
                             alignment: .topLeading
                        
                                    )
                    .animation(.easeInOut, value: animate)
            }
            .frame(width: 380,height: 100)
            //.background(Color.gray)
            .onAppear{startTimer()}
        }
        
        private func startTimer() {
               timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
               //    withAnimation(.linear) {
                      
                       index = (index + 1) % images.count
                   animate.toggle()
                //   }
               }
           }
    }


struct TopSelfSection_Previews: PreviewProvider {
    static var previews: some View {
        TopSelfSection()
    }
}
