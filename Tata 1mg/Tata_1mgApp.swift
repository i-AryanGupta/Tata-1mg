//
//  Tata_1mgApp.swift
//  Tata 1mg
//
//  Created by Yashom on 18/10/24.
//

import SwiftUI
//merging brannch error
@main
struct Tata_1mgApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var authViewModel = AuthViewModel()
    @StateObject private var cartViewModel = CartViewModel(products: JSONLoader.loadProductData())

       var body: some Scene {
           WindowGroup {
               NavigationView {
                   
                   
                   //HomePageView() // Root View
                   //
                   //HomeTabView()
                   OnboardingScreen()
                       .environmentObject(authViewModel)
                       .environmentObject(cartViewModel)
                   //            ContentView()
                   //                .environment(\.managedObjectContext, persistenceController.container.viewContext)

               }
               .navigationViewStyle(.stack)
            
        }
    }
}


