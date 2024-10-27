//
//  Tata_1mgApp.swift
//  Tata 1mg
//
//  Created by Yashom on 18/10/24.
//

import SwiftUI

@main
struct Tata_1mgApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var authViewModel = AuthViewModel()

       var body: some Scene {
           WindowGroup {
               NavigationView {
                   
//                   HomeTabView() // Root View
                   OnboardingScreen()
                       .environmentObject(authViewModel)
                   //            ContentView()
                   //                .environment(\.managedObjectContext, persistenceController.container.viewContext)

               }
               .navigationViewStyle(.stack)
            
        }
    }
}


