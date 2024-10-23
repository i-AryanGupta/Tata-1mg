//
//  HomeTabView.swift
//  Tata 1mg
//
//  Created by Yashom on 23/10/24.
//

import SwiftUI

import SwiftUI

struct HomeTabView: View {
    var body: some View {
        TabView {
            // Home Tab
            HomePageView()
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
                    ZStack {
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.orange) // Placeholder for circular image background
                        Text("Care Plan")
                            .foregroundColor(.white) // Custom text over the circle
                    }
                    Text("Get Care Plan") // Label
                }
            
            // Lab Tests Tab
            LabTestsView()
                .tabItem {
                    Image(systemName: "flask.fill")
                    Text("Lab tests")
                }
            
            // Profile Tab
            ProfileView()
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

struct GetCarePlanView: View {
    var body: some View {
        VStack {
            Text("This is the Get Care Plan Page")
                .navigationTitle("Get Care Plan")
        }
    }
}

struct LabTestsView: View {
    var body: some View {
        Text("This is the Lab Tests Page")
            .navigationTitle("Lab Tests")
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
