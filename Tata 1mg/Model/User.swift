//
//  User.swift
//  Tata 1mg
//
//  Created by Yashom on 26/10/24.
//

import Foundation

struct UserModel: Identifiable {
    let id = UUID()
    var name: String
    var email: String
    var password: String
}
