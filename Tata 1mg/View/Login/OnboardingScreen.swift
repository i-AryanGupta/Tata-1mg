//
//  OnboardingScreen.swift
//  Tata 1mg
//
//  Created by Yashom on 18/10/24.
//

import SwiftUI

struct OnboardingScreen: View {
    @State var showLogin = false
    @State private var selectPage = 0
    @State var pageArr = [
        [
            "title": "Your go-to health app",
            "subtitle": "Your complete heathcare companion in your pocket",
            "image": "onBoard_1"
        ],
                
        [
            "title": "Home delivery of medicines",
            "subtitle": "Order any medicine or health product",
            "image": "onBoard_2"
        ],
                
        [    "title": "Lab tests at home",
             "subtitle": "Book any test from any lab.",
             "image": "onBoard_3"
        ],
    ]
    
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack(alignment: .center){
            
            TabView(selection: $selectPage.animation()){
                ForEach(0 ..< pageArr.count, id: \.self){
                    index in
                    
                    let iObj = pageArr[index]
                    VStack{
                        Spacer()
                        
                        HStack{
                            Image(iObj["image"] ?? "")
                                .resizable()
                                .scaledToFit()
                                .frame(width: .widthPer(per: 0.65))
                        }
                        .frame(width: 300, height: 300, alignment: .center)
                        
                        Text(iObj["title"] ?? "")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 25, weight: .bold, design: .rounded))
                            .padding()
                        
                        Text(iObj["subtitle"] ?? "")
                            .multilineTextAlignment(.center)
                            .font(.customFont(.medium, fontSize: 15))
                        
                        Spacer()
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .onReceive(timer) { _ in
                            withAnimation {
                                // Increment the page index or loop back to 0
                                selectPage = (selectPage + 1) % pageArr.count
                            }
                        }
            // for capsule i.e dots when slide
            .overlay(HStack(spacing: 8){
                ForEach(0 ..< pageArr.count, id: \.self){
                    index in
                    
                    Capsule()
                        .fill(selectPage == index ? Color.primaryText : Color.gray)
                        .frame(width: 8, height: 8)
                }
            }.padding(.bottom, .heightPer(per: 0.15)), alignment: .bottom)
            
            VStack{
                
                Spacer()
                
                Button(action: {
                    showLogin = true
                },
                       label: { Text("Get Started")
                        .font(.customFont(.bold, fontSize: 14))
                    
                })
                .foregroundColor(.btnPrimaryText)
                .frame(width: 350, height: 50)
                .background(Color.btnBG)
                .cornerRadius(25)
                
            }
        }
        .bgNavLink(content: LogInView(), isAction: $showLogin)
    }
}


struct OnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            OnboardingScreen()
        }
        
    }
}
