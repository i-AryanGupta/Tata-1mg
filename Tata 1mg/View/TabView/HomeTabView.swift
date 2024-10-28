//
//  HomeTabView.swift
//  Tata 1mg
//
//  Created by Yashom on 23/10/24.
//

import SwiftUI

struct HomeTabView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var cartViewModel: CartViewModel
    
    var body: some View {
        TabView {
            // Home Tab
            HomePageView()
                .environmentObject(cartViewModel)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            // Health Plans Tab
            HealthPlansView()
                .tabItem {
                    Image(systemName: "doc.text.fill")
                    Text("Health plans")
                }
            
            // Get Care Plan Tab (with custom circular image)
            GetCarePlanView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Care Plan")
                    //CustomCarePlanTabView()
                }

            // Lab Tests Tab
            LabTestsView()
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Lab tests")
                }
            
            // Profile Tab
            ProfileView()
                .environmentObject(authViewModel)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
        .accentColor(.black)
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
    }
}

//struct HomeTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeTabView()
//            .environmentObject(authViewModel)
//    }
//}
