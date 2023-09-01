//
//  EmalSignUpFormView.swift
//  ChordShop
//
//  Created by Lucas Petrola on 01/09/23.
//

import SwiftUI

struct EmailSignUpFormView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var checked = false
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("email_tf", text: $email)
                .textFieldStyle(GradientTextFieldBackground(systemImageString: "person"))
                .keyboardType(.emailAddress)
            
            SecureField("password_tf", text: $password)
                .textFieldStyle(GradientTextFieldBackground(systemImageString: "key"))
            
            TextField("token_field_label", text: $password)
                .textFieldStyle(GradientTextFieldBackground(systemImageString: "key"))
            
            Text("token_label_comment")
                .foregroundColor(.secondary)
                .font(.system(size: 14))
                .padding(3)
            
            // Checkbox View
            HStack {
                CheckBoxView(checked: $checked)
                Text("accept_terms_and_conditions")
            }
            
            GradientButtonView(completion: {
                
            }, title: "sign_up")
            
        }
    }
}

struct EmailSignUpFormView_Previews: PreviewProvider {
    static var previews: some View {
        EmailSignUpFormView()
    }
}
