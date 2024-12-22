//
//  LoginView.swift
//  WhereYouAt
//
//  Created by Enzo Weiss on 12/22/24.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""
    @State private var isLoggedIn = false
    
    var body: some View {
        if isLoggedIn {
            MainView()
        } else {
            VStack {
                Text("Log In")
                    .font(.largeTitle)
                    .bold()
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button("Log In") {
                    loginUser()
                }
                .padding()
                .buttonStyle(.borderedProminent)
                Text(errorMessage).foregroundColor(.red)
            }
            .padding()
        }
    }
    
    func loginUser() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                isLoggedIn = true
            }
        }
    }
}

