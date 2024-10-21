//
//  SignUpView.swift
//  Tata 1mg
//
//  Created by Yashom on 21/10/24.
//

import SwiftUI

struct SignUpView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var onSubmit = false
    @State private var onLogin = false
    @State private var isKeyboardVisible = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Spacer()
                
                // Conditionally show the image based on keyboard visibility
                if !isKeyboardVisible{
                    Image("onBoard_1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                }
                
                Text("Sign up to continue")
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                    .padding(.bottom, 10)
                
                VStack(spacing: 15) {
                    CustomTextField(placeholder: "Enter name", text: $name)
                    
                    CustomTextField(placeholder: "Enter email", text: $email)
                    
                    CustomTextField(placeholder: "Enter password", text: $password, isSecure: true)
                }
                .padding(.horizontal, 20)
                
                CustomButton(title: "Submit") {
                    onSubmit = true
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)
                
                HStack {
                    Text("Already have an account?")
                        .font(.system(size: 14))
                    Button(action: {
                        onLogin = true
                    }) {
                        Text("Log In")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(Color.orange)
                    }
                }
                .padding(.top, 10)
                
                Spacer()
            }
        }
        .keyboardResponsive(isKeyboardVisible: $isKeyboardVisible) // Apply the keyboard responsive modifier
        .bgNavLink(content: LogInView(), isAction: $onSubmit)
        .bgNavLink(content: LogInView(), isAction: $onLogin)
    }
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
