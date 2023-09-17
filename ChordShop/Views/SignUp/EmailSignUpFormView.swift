//
//  EmalSignUpFormView.swift
//  ChordShop
//
//  Created by Lucas Petrola on 01/09/23.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct EmailSignUpFormView: View {
    
    // MARK: Field values
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var token: String = ""
    @State private var checked: Bool = false
    
    // MARK: Presentations
    @State private var warningPresent: Bool = false
    @State private var successPresent: Bool = false
    @State private var invalidFieldPresent: Bool = false
    
    let validators = Validators()
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("email_tf", text: $email)
                .textFieldStyle(GradientTextFieldBackground(systemImageString: "person"))
                .keyboardType(.emailAddress)
                .textContentType(.emailAddress)
                .textInputAutocapitalization(.never)
            
            SecureField("password_tf", text: $password)
                .textFieldStyle(GradientTextFieldBackground(systemImageString: "key"))
            
            TextField("token_field_label", text: $token)
                .textFieldStyle(GradientTextFieldBackground(systemImageString: "key"))
            
            Text("token_label_comment")
                .foregroundStyle(.background)
                .font(.system(size: 14))
            
            // Checkbox View
            HStack {
                CheckBoxView(checked: $checked)
                Text("accept_terms_and_conditions")
            }
            
            GradientButtonView(completion: {
                let authController = AuthController(email: email, password: password, token: token)
                
                authController.checkStudentKey {
                    authController.signUp {
                        let authController = AuthController(email: email)
                        
                        authController.sendEmailVerification {
                            successPresent = true
                        }
                    } isError: {
                        invalidFieldPresent = true
                    }
                } isError: {
                    warningPresent = true
                }
                
            }, title: "sign_up", isDisabled: validators.isDisabled(
                token: token,
                email: email,
                password: password,
                checked: checked))
        }
        // Invalid key
        .alert("alert", isPresented: $warningPresent) {
            Button("close", role: .cancel) {}
        } message: {
            Text("key_is_not_valid")
        }
        // Invalid email
        .alert("error", isPresented: $invalidFieldPresent) {
            Button("close", role: .cancel) {}
        } message: {
            Text("invalid_email")
        }
        // User SignUp
        .alert("user_created", isPresented: $successPresent) {
            Button("return_to_login") {
                self.presentationMode.wrappedValue.dismiss()
            }
        } message: {
            Text("you_can_sign_in_now")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct EmailSignUpFormView_Previews: PreviewProvider {
    static var previews: some View {
        EmailSignUpFormView()
    }
}
