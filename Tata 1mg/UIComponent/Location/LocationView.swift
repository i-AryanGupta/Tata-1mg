//
//  LocationView.swift
//  Tata 1mg
//
//  Created by Yashom on 26/10/24.
//
import SwiftUI

struct LocationView: View {
    @Binding var selectedCity: String
    @Binding var isPresented: Bool
    @State private var searchText = ""
    @State private var isLoading = false
    @State private var navigateToHome = false
    
    let cities = ["Gurgaon", "New Delhi", "Bangalore", "Hyderabad", "Mumbai", "Pune"]
    
    var filteredCities: [String] {
        cities.filter { searchText.isEmpty ? true : $0.lowercased().contains(searchText.lowercased()) }
    }
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    TextField("Search for your city", text: $searchText)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal)
                    
                    Button(action: {
                        selectCity("Current Location")
                    }) {
                        HStack {
                            Image(systemName: "location.fill")
                            Text("Use your current location")
                        }
                        .foregroundColor(.orange)
                    }
                    .padding()
                    
                    // City List filtered by search query
                    List(filteredCities, id: \.self) { city in
                        HStack {
                            Image(systemName: "building.2.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.orange)
                                .frame(width: 50, height: 80)
                            Text(city)
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .onTapGesture {
                            selectCity(city)
                        }
                    }
                }
                .navigationBarTitle("Select City", displayMode: .inline)
            }
            
            if isLoading {
                LoadingView(selectedCity: selectedCity)
                    .transition(.move(edge: .trailing))
            }
        }
    }
    
    private func selectCity(_ city: String) {
        selectedCity = city
        withAnimation(.easeInOut) {
            isLoading = true
        }
        
        // Simulate loading delay before navigating back to HomePageView
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isLoading = false
            isPresented = false
        }
    }
}

