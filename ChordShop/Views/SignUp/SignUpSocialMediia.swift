//
//  SignUpSocialMediia.swift
//  ChordShop
//
//  Created by Lucas Petrola on 15/09/23.
//

import SwiftUI

struct SignUpSocialMediia: View {
    
    // MARK: Field values
    @State private var checked: Bool = false
    @State private var token: String = ""
    
    // MARK: Presentations
    @State private var warningPresent: Bool = false
    @State private var successPresent: Bool = false
    
    let validators = Validators()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("token_label_comment")
                .foregroundStyle(.background)
                .font(.system(size: 14))
                .padding(3)
            
            // Checkbox View
            HStack {
                CheckBoxView(checked: $checked)
                Text("accept_terms_and_conditions")
            }
            
            GradientButtonView(completion: {
                let authController = AuthController(token: token)
                
                authController.checkStudentKey {
                    authController.signUp {
                        successPresent = true
                    }
                } isError: {
                    warningPresent = true
                }
                
            }, title: "sign_up")
            .disabled(validators.isDisabledSocialMedia(
                token: token,
                checked: checked)
            )
            .opacity(
                validators.isDisabledSocialMedia(
                    token: token,
                    checked: checked)
                ? 0.5
                : 1
            )
            
        }
        // Invalid key
        .alert("alert", isPresented: $warningPresent) {
            Button("close", role: .cancel) {}
        } message: {
            Text("key_is_not_valid")
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

struct SignUpSocialMediia_Previews: PreviewProvider {
    static var previews: some View {
        SignUpSocialMediia()
    }
}
