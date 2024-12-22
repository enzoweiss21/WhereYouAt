import SwiftUI
import Firebase

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""
    @State private var isLoggedIn = false
    @State private var isLoading = false // For showing a loading spinner

    init() {
        checkIfLoggedIn() // Check login status on launch
    }

    var body: some View {
        if isLoggedIn {
            ContentView() // Redirect to main content if logged in
        } else {
            VStack {
                Text("Log In")
                    .font(.largeTitle)
                    .bold()

                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .autocapitalization(.none)
                    .disableAutocorrection(true)

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                if isLoading {
                    ProgressView() // Show a spinner while logging in
                        .padding()
                }

                Button(action: loginUser) {
                    Text("Log In")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()

                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()

                Spacer()

                Button("Sign Up") {
                    // Navigate to SignUpView (implement later)
                    print("Navigate to Sign Up")
                }
                .padding()
            }
            .padding()
        }
    }

    func loginUser() {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Email and password cannot be empty."
            return
        }

        isLoading = true
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            isLoading = false
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                isLoggedIn = true
            }
        }
    }

    func checkIfLoggedIn() {
        // Check if the user is already logged in
        if Auth.auth().currentUser != nil {
            isLoggedIn = true
        }
    }
}

