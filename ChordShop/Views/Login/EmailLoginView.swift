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
                
            }, title: "button_label")
        }
    }
}

struct EmailLoginView_Previews: PreviewProvider {
    static var previews: some View {
        EmailLoginView()
    }
}
