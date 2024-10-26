//
//  HomePageView.swift
//  Tata 1mg
//
//  Created by Yashom on 21/10/24.
//

import SwiftUI

struct HomePageView: View {
    @State private var searchText: String = ""
    @StateObject private var cartViewModel = CartViewModel()
    @State private var showCart = false
    @State private var showLocation = false
    @State private var selectedCity: String = "Bangalore"
    let productsFile = ProductsFile()
    
    // Sample data for health essentials
        let healthEssentials = [
            (name: "Stomach Care", image: "azit2"),
            (name: "Cold & Cough", image: "vivks1"),
            (name: "Pain Relief", image: "iodex1"),
            (name: "First Aid", image: "paracetamol"),
            (name: "Diabetes", image: "pills1"),
            (name: "Eye & Ear Care", image: "azit1")
        ]

    
    var body: some View {
        NavigationView { // NavigationView Start
            ScrollView { // ScrollView Start
                VStack(spacing: 30) { // VStack Start
                    
                    // Top bar with Location and Cart buttons
                    HStack { // HStack for Top Bar Start
                        Button(action: {
                            showLocation = true
                        }) {
                            HStack { // HStack for Location Button Start
                                Image(systemName: "location.fill")
                                    .font(.title3)
                                    .foregroundColor(Color.white)
                                    .frame(width: 40, height: 40)
                                    .background(Color.btnBG)
                                    .cornerRadius(22)
                                
                                Text(selectedCity)
                                    .font(.headline)
                                    .foregroundColor(Color.primaryText)
                            } // HStack for Location Button End
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            showCart = true
                        }) {
                            HStack { // HStack for Cart Button Start
                                Image(systemName: "cart.fill")
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(Color.white)
                                    .background(Color.gray.opacity(0.5))
                                    .cornerRadius(22)
                                
                                // Show the cart count dynamically
                                if cartViewModel.cartItems.count > 0 {
                                    Text("\(cartViewModel.cartItems.count)")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .frame(width: 20, height: 20)
                                        .background(Color.orange)
                                        .clipShape(Circle())
                                        .offset(x: -10, y: -10)
                                }
                            } // HStack for Cart Button End
                        }
                    } // HStack for Top Bar End
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    
                    VStack(spacing: 15){
                        SearchBarProductView()
                            .padding(.leading, 10)
                            .padding(.trailing, 10)
                        
                        // Top section (could be promotions, categories, etc.)
                        TopSelfSection()
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                            .padding(.top, 10)
                        
                        CustomImageScroll(imageNames: ["hair_poster", "med_poster", "fever_poster", "equip_poster"])
                        
                        // Wellness and Medicine product sections
                        VStack(alignment: .leading) { // VStack for Wellness Products Start
                            Text("Wellness Products")
                                .font(.headline)
                                .padding(.leading, 20)
                            
                            ScrollView(.horizontal, showsIndicators: false) { // ScrollView for Wellness Products Start
                                HStack(spacing: 20) { // HStack for Wellness Product Stack Start
                                    productStack(for: "Wellness")
                                } // HStack for Wellness Product Stack End
                                .padding(.horizontal)
                            } // ScrollView for Wellness Products End
                        } // VStack for Wellness Products End
                        .padding(.horizontal)
                        
                        //personal care
                    }
                    
                    // Health Essentials Grid
                    VStack(alignment: .leading) {
                        Text("Health essentials")
                            .font(.headline)
                            .padding(.leading, 20)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                            ForEach(healthEssentials, id: \.name) { item in
                                NavigationLink(destination: CategoryDetailView(cartViewModel: cartViewModel)) {
                                    SpecificProductCell(data: item.name, image: item.image)
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    
                    
                    VStack(alignment: .leading) { // VStack for Medicine Products Start
                        Text("Medicine Products")
                            .font(.headline)
                            .padding(.leading, 20)
                        
                        ScrollView(.horizontal, showsIndicators: false) { // ScrollView for Medicine Products Start
                            HStack(spacing: 20) { // HStack for Medicine Product Stack Start
                                productStack(for: "Medicine")
                            } // HStack for Medicine Product Stack End
                            .padding(.horizontal)
                        } // ScrollView for Medicine Products End
                        //} // VStack for Medicine Products End
                        //.padding(.horizontal)
                        
                        //VStack(alignment: .leading) { // VStack for Last Minute Buy Start
                        Text("Last minute buy")
                            .font(.headline)
                            .padding(.leading, 20)
                        
                        ScrollView(.horizontal, showsIndicators: false) { // ScrollView for Last Minute Buy Start
                            HStack(spacing: 20) { // HStack for Last Minute Buy Stack Start
                                productStack(for: "Medicine")
                            } // HStack for Last Minute Buy Stack End
                            .padding(.horizontal)
                        } // ScrollView for Last Minute Buy End
                    } // VStack for Last Minute Buy End
                    .padding(.horizontal)
                    
                    CustomAdView(imageName: "tata_ad")
                    
                    VStack(alignment: .leading) { // VStack for SkinCare Products Start
                        Text("SkinCare Products")
                            .font(.headline)
                            .padding(.leading, 20)
                        
                        ScrollView(.horizontal, showsIndicators: false) { // ScrollView for SkinCare Products Start
                            HStack(spacing: 20) { // HStack for SkinCare Product Stack Start
                                productStack(for: "Wellness")
                            } // HStack for SkinCare Product Stack End
                            .padding(.horizontal)
                        } // ScrollView for SkinCare Products End
                    } // VStack for SkinCare Products End
                    .padding(.horizontal)
                    
                    CustomAdView(imageName: "wellwomen_ad")
                    
                    // Uncomment if BottomImage is needed
                    VStack(alignment: .leading) {
                        BottomImage()
                    }
                    
                    
                } // Main VStack End
            } // ScrollView End
        } // NavigationView End
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
        .bgNavLink(content: CartView(cartViewModel: cartViewModel), isAction: $showCart)
        .bgNavLink(content: LocationView(selectedCity: $selectedCity, isPresented: $showLocation), isAction: $showLocation)
    }
    
    // Method to generate a stack of products based on their type
    func productStack(for type: String) -> some View {
        let filteredProducts = productsFile.productCellData.filter { $0.productType == type }
        
        return ForEach(filteredProducts) { product in
            ProductCellDataReusable(cartViewModel: cartViewModel, product: product)
        }
    }
} // HomePageView End



struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
