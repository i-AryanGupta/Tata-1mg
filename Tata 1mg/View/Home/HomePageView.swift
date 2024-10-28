//
//  HomePageView.swift
//  Tata 1mg
//
//  Created by Yashom on 21/10/24.
//

import SwiftUI

struct HomePageView: View {
    @State private var searchText: String = ""
    @State private var showCart = false
    @State private var showLocation = false
    @State private var selectedCity: String = "Bangalore"
    
    // Load products from JSON
    let products: [ProductCellData]
    
    // Initialize CartViewModel with loaded products
    @EnvironmentObject private var cartViewModel: CartViewModel
    
    init() {
        // Load products from JSON
        let loadedProducts = JSONLoader.loadProductData()
        
        // Debug: Print loaded products and their types
        print("Loaded Products:", loadedProducts)
        loadedProducts.forEach { product in
            print("Product Type:", product.productType)
        }
        
        // Initialize products
        self.products = loadedProducts
    }

    
    let healthEssentials = [
        (name: "Stomach Care", image: "azit2"),
        (name: "Cold & Cough", image: "vivks1"),
        (name: "Pain Relief", image: "iodex1"),
        (name: "First Aid", image: "paracetamol"),
        (name: "Diabetes", image: "pills1"),
        (name: "Eye & Ear Care", image: "azit1")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {
                    // Top bar with Location and Cart buttons
                    HStack {
                        Button(action: { showLocation = true }) {
                            HStack {
                                Image(systemName: "location.fill")
                                    .font(.title3)
                                    .foregroundColor(Color.white)
                                    .frame(width: 40, height: 40)
                                    .background(Color.btnBG)
                                    .cornerRadius(22)
                                
                                Text(selectedCity)
                                    .font(.headline)
                                    .foregroundColor(Color.primaryText)
                            }
                        }
                        Spacer()
                       
                        Button(action: { showCart = true }) {
                            HStack {
                                Image(systemName: "cart.fill")
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(Color.white)
                                    .background(Color.gray.opacity(0.5))
                                    .cornerRadius(22)
                                
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
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    VStack(spacing: 15){
                        SearchBarProductView()
                            .padding(.horizontal, 10)
                        
                        TopSelfSection()
                            .padding([.leading, .trailing, .top], 20)
                        
                        CustomImageScroll(imageNames: ["hair_poster", "med_poster", "fever_poster", "equip_poster"])
                        
                        // Wellness and Medicine product sections
                        VStack(alignment: .leading) {
                            HStack{
                                Text("Wellness Products")
                                    .font(.headline)
                                    .padding(.leading, 20)
                                Spacer()
                                SeeMoreButton()
                                    .padding(.trailing, 10)
                            }
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    productStack(for: "Wellness")
                                }
                                .padding(.horizontal)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Health Essentials Grid
                    VStack(alignment: .leading) {
                        Text("Health essentials")
                            .font(.headline)
                            .padding(.leading, 20)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                            ForEach(healthEssentials, id: \.name) { item in
                                NavigationLink(destination: CategoryDetailView()) {
                                    SpecificProductCell(data: item.name, image: item.image)
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Medicine Products")
                                .font(.headline)
                                .padding(.leading, 20)
                            Spacer()
                            SeeMoreButton()
                                .padding(.trailing, 10)
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                productStack(for: "Medicine")
                            }
                            .padding(.horizontal)
                        }
                        
                        HStack {
                            Text("Last minute buy")
                                .font(.headline)
                                .padding(.leading, 20)
                            Spacer()
                            SeeMoreButton()
                                .padding(.trailing, 10)
                        }
                        .padding(.top, 10)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                productStack(for: "Medicine")
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.horizontal)
                    
                    CustomAdView(imageName: "tata_ad")
                    
                    VStack(alignment: .leading) {
                        HStack{
                            Text("SkinCare Products")
                                .font(.headline)
                                .padding(.leading, 20)
                            Spacer()
                            SeeMoreButton()
                                .padding(.trailing, 10)
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                productStack(for: "Wellness")
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.horizontal)
                    
                    CustomAdView(imageName: "wellwomen_ad")
                    VStack(alignment: .leading) {
                        BottomImage()
                    }
                }
            }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
        .bgNavLink(content: CartView().environmentObject(cartViewModel), isAction: $showCart)
        .bgNavLink(content: LocationView(selectedCity: $selectedCity, isPresented: $showLocation), isAction: $showLocation)
        .environmentObject(cartViewModel)
    }
    
    func productStack(for type: String) -> some View {
        let filteredProducts = products.filter { $0.productType == type }
        print("Filtered Products for type \(type): \(filteredProducts)")
        return ForEach(filteredProducts) { product in
            ProductCellDataReusable(product: product)
                .id(product.id) // Ensure that SwiftUI tracks each product individually
        }
    }

}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleProducts = [
            ProductCellData(
                productName: "Sample Product 1",
                productImages: ["defaultImage"],
                productPrice: 100.0,
                productDiscountedPrice: 80.0,
                deliveryDate: "11-12",
                productType: "Wellness",
                productInformation: "Sample information for product 1"
            ),
            ProductCellData(
                productName: "Sample Product 2",
                productImages: ["defaultImage"],
                productPrice: 150.0,
                productDiscountedPrice: 120.0,
                deliveryDate: "11-12",
                productType: "Medicine",
                productInformation: "Sample information for product 2"
            )
        ]
        
        let cartViewModel = CartViewModel(products: sampleProducts)
        
        HomePageView()
            .environmentObject(cartViewModel)
            .previewDevice("iPhone 12")
    }
}

