//
//  ForgetPasswordFormView.swift
//  ChordShop
//
//  Created by Lucas Petrola on 15/09/23.
//

import SwiftUI

struct ForgetPasswordFormView: View {
    
    @State var email: String = ""
    @State var alertRecoverPresent: Bool = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            TextField("recuperation_email", text: $email)
                .textFieldStyle(GradientTextFieldBackground(systemImageString: "person"))
                .keyboardType(.emailAddress)
                .textContentType(.emailAddress)
                .textInputAutocapitalization(.never)
            
            Text("")
                .font(.system(size: 14))
                .foregroundColor(.secondary)
            
            GradientButtonView(completion: {
                SendRecoverEmail()
            }, title: "send_recuperation_button_title", isDisabled: email.isEmpty)
        }
        .alert("alert", isPresented: $alertRecoverPresent) {
            Button("return_to_login") {
                self.presentationMode.wrappedValue.dismiss()
            }
        } message: {
            Text("email_alert_recuperation_message")
        }
    }
    
    func SendRecoverEmail () {
        let authController = AuthController(email: email)
        
        authController.recoverEmail{
            alertRecoverPresent = true
        }
    }
}

struct ForgetPasswordFormView_Previews: PreviewProvider {
    static var previews: some View {
        ForgetPasswordFormView()
        
    }
}
