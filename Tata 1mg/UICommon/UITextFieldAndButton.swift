//
//  UITextFieldAndButton.swift
//  Tata 1mg
//
//  Created by Yashom on 21/10/24.
//

import SwiftUI

import SwiftUI

struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    
    var body: some View {
        if isSecure {
            SecureField(placeholder, text: $text)
                .textInputAutocapitalization(.never)
                .padding()
                .frame(height: 50)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.5), lineWidth: 1))
        } else {
            TextField(placeholder, text: $text)
                .textInputAutocapitalization(.never)
                .padding()
                .frame(height: 50)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.5), lineWidth: 1))
        }
    }
}

struct CustomButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(Color.orange)
                .cornerRadius(10)
        }
    }
}

