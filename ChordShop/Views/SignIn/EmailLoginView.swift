//
//  EmailLoginView.swift
//  ChordShop
//
//  Created by Lucas Petrola on 01/09/23.
//

import SwiftUI

struct EmailLoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var pushToHome: Bool = false
    
    // Alert states
    @State private var loginErrorPresent: Bool = false
    @State private var emailVerifiedErrorPresent: Bool = false
    
    let validators = Validators()
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("email_tf", text: $email)
                .textFieldStyle(GradientTextFieldBackground(systemImageString: "person"))
                .textInputAutocapitalization(.never)
            
            SecureField("password_tf", text: $password)
                .textFieldStyle(GradientTextFieldBackground(systemImageString: "key"))
                .textInputAutocapitalization(.never)
            
            NavigationLink {
                ForgetPasswordView()
            } label: {
                Text("forggot_password")
                    .frame(alignment: .leading)
            }
            
            GradientButtonView(completion: {
                let authController = AuthController(email: email, password: password)
                
                authController.signIn {
                    pushToHome = true
                } isError: {
                    loginErrorPresent = true
                } isVerifiedEmailError: {
                    emailVerifiedErrorPresent = true
                }
                
            }, title: "button_label", isDisabled: validators.isDisabled(email: email, password: password))
            
            // MARK: Navigations Widgets
            NavigationLink(destination: HomePageView(), isActive: $pushToHome) { EmptyView() }
            
        }
        .alert("error", isPresented: $loginErrorPresent) {
            Button("close", role: .cancel) {}
        } message: {
            Text("login_error_message")
        }
        .alert("email_not_verified_error", isPresented: $emailVerifiedErrorPresent) {
            Button("close", role: .cancel) {}
        } message: {
            Text("email_not_verified_message")
        }
    }
}

struct EmailLoginView_Previews: PreviewProvider {
    static var previews: some View {
        EmailLoginView()
    }
}
