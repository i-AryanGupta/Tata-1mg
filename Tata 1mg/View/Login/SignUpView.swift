//
//  SignUpView.swift
//  Tata 1mg
//
//  Created by Yashom on 21/10/24.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var signUpFailed = false
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
                    if authViewModel.signUp(name: name, email: email, password: password) {
                        onLogin = true // Navigate to LogInView
                    }else {
                        signUpFailed = true // Trigger failure alert or message
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)
                
                if signUpFailed {
                    Text("Email already exists. Try logging in.")
                        .foregroundColor(.red)
                        .padding(.top, 10)
                }
                
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
        .bgNavLink(content: LogInView().environmentObject(authViewModel), isAction: $onLogin)
    }
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
