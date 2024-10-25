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

       var body: some Scene {
           WindowGroup {
               NavigationView {
                   OnboardingScreen()
                   //            ContentView()
                   //                .environment(\.managedObjectContext, persistenceController.container.viewContext)

               }
               .navigationViewStyle(.stack)
            
        }
    }
}



