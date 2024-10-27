//
//  AuthViewModel.swift
//  Tata 1mg
//
//  Created by Yashom on 26/10/24.
//

import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var isUserLoggedIn = false
    @Published var users: [UserModel] = [ // Remove `private` to make it public
        UserModel(name: "Aryan", email: "aryan@gmail.com", password: "1234")
    ]
    @Published var currentUser: UserModel? = nil

    func signUp(name: String, email: String, password: String) -> Bool {
        if users.contains(where: { $0.email == email }) {
            print("Sign-Up Failed: Email \(email) already exists")
            return false
        }
        
        let newUser = UserModel(name: name, email: email, password: password)
        users.append(newUser)
        print("Sign-Up Success: New user added with email \(email)")
        print("Current Users: \(users)") // For debugging
        return true
    }
    
    func logIn(email: String, password: String) -> Bool {
        if let user = users.first(where: { $0.email == email && $0.password == password }) {
            isUserLoggedIn = true
            currentUser = user
            print("Login Success: Logged in as \(user.name)")
            return true
        }
        print("Login Failed: Incorrect email or password for email \(email)")
        return false
    }
    
    func logOut() {
        isUserLoggedIn = false
        currentUser = nil
    }
}


