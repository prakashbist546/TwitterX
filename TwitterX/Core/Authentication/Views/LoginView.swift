//
//  LoginView.swift
//  TwitterX
//
//  Created by Prakash Bist on 2023/08/11.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var viewModel:AuthViewModel
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            
            AuthHeaderView(title1: "Hello", title2: "Welcome Back")
            
            Spacer()
            
            VStack(spacing: 60) {
                CustomTextField(imageName: "envelope", placeholderText: "Email", isSecureField: false, text: $email)
                
                CustomTextField(imageName: "lock", placeholderText: "Password", isSecureField: true, text: $password)
            }
            .padding(.horizontal, 32)
            
            HStack {
                Spacer()
                
                NavigationLink {
                    Text("Reset password view")
                } label: {
                     Text("Forgot Password")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.blue)
                        .padding(.top)
                        .padding(.trailing, 24)
                }
            }
            
            Button {
                viewModel.login(withEmail: email, password: password)
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundStyle(Color.white)
                    .frame(width: 340, height: 50)
                    .background(.blue)
                    .clipShape(Capsule())
                    .padding()
            }
            .padding()
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            
            Spacer()
            
            NavigationLink {
                RegistrationView()
                    .navigationBarHidden(true)
            } label: {
                HStack {
                    Text("Don't have an account?")
                        .font(.footnote)
                    
                    Text("Sign Up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                .padding(.bottom, 32)
                .foregroundStyle(Color.blue)
            }

        }
        .ignoresSafeArea()
    }
}

#Preview {
    LoginView()
}
