//
//  AuthViewModel.swift
//  TwitterX
//
//  Created by Prakash Bist on 2023/08/11.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email : String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: login error occured \(error.localizedDescription)")
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: fail to register user \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            
            let data = ["Email": email, "username": username.lowercased(), "fullname": fullname, "uid": user.uid]
            
            Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
            print("DEBUG: User created and data uploaded.")
            }
        }
    }
    
    func signout() {
        userSession = nil
        try? Auth.auth().signOut()
    }
}
