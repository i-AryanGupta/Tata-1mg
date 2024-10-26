//
//  ProfileView.swift
//  Tata 1mg
//
//  Created by Yashom on 22/10/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var name: String = "there!"
    @State private var subName :String = "Sign in to start your healthcare journey"
    @State private var showSignIn = false
    var icons = ProfileData().iconImage
    var mainList = ProfileData().profileList
    @State var about = ProfileData().section
    
    var body: some View {
        
        NavigationView {
            ZStack( alignment:.topLeading){
                Color(.gray)
                    .opacity(0.3)
                    .ignoresSafeArea()
                
                
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    Text("hi \(name)")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text(subName)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    CustomButton(title: "Sign in") {
                        showSignIn = true
                    }
                    .padding(.vertical,10)
                    
                    //  VStack(alignment: .leading, spacing: 0){
                    List {
                        ForEach((0..<mainList.count),id: \.self) { data in
                            NavigationLink {
                                
                            } label: {
                                HStack{
                                    Image(systemName: icons[data])
                                    Text(mainList[data])
                                    //Text("\(data), \(mainList[data])")
                                }
                            }
                            
                        }
                    }
                    .listStyle(PlainListStyle())
                    .frame(minWidth: 0,maxWidth: .infinity)
                    .frame(height: 370)
                    .cornerRadius(15)
                    .clipped()
                    //  }
                    
                    
                    Spacer().frame(height: 10)
                    
                    List {
                        ForEach(about,id: \.self) { data in
                            NavigationLink {
                                
                            } label: {
                                HStack{
                                    // Image(systemName: icons)
                                    Text(data)
                                    //Text("\(data), \(mainList[data])")
                                }
                            }
                            
                        }
                    }
                    .listStyle(PlainListStyle())
                    .clipped()
                    .frame(minWidth: 0,maxWidth: .infinity)
                    .frame(height: 130)
                    .cornerRadius(15)
                    Spacer()
                    
                    Text("Making HealthCare")
                    Text("UnderStandable, Accessible & Affordable")
                        .bold()
                        .foregroundColor(.gray)
                    
                }
                .padding(15)
                // .shadow(color: .gray.opacity(0.3), radius: 2,x: 0,y: 2)
            }
            
        }
        .bgNavLink(content: LogInView(), isAction: $showSignIn)
        
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
