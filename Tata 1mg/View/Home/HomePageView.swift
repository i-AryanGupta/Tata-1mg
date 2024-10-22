//
//  HomePageView.swift
//  Tata 1mg
//
//  Created by Yashom on 21/10/24.
//

import SwiftUI

struct HomePageView: View {
    @State private var searchText: String = ""
    let productsFile = ProductsFile()
    var body: some View{
        NavigationView{
            ScrollView{
                VStack(spacing: 30){
                    HStack {
                        HStack {
                            Button(action: {
                                // Handle Location button action
                            }) {
                                Image(systemName: "location.fill")
                                    .font(.title3)
                                    .foregroundColor(Color.white)
                                    .frame(width: 40, height: 40)
                                    .background(Color.btnBG)
                                    .cornerRadius(22)
                                
                                Text("Location")
                                    .font(.headline)
                                    .foregroundColor(Color.primaryText)
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                // Handle cart button action
                            }) {
                                Image(systemName: "cart.fill")
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(Color.white)
                                    .background(Color.gray.opacity(0.5))
                                    .cornerRadius(22)
                            }
                        }
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        
                    }
                    SearchBarProductView()
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                    
                    TopSelfSection()
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                    
                } // vstack
            }
            
        }// navi
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
        
    }
}




struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
