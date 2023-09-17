//
//  ForgetPasswordView.swift
//  ChordShop
//
//  Created by Lucas Petrola on 15/09/23.
//

import SwiftUI

struct ForgetPasswordView: View {
    var body: some View {
        NavigationStack {
            Divider()
            
            VStack {
                ForgetPasswordFormView()
                Spacer()
            }
            .padding()
            .navigationTitle("forgget_password_title")
        }
    }
    
}

struct ForgetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        // MARK: Languages Preview
        ForgetPasswordView()
            .environment(\.locale, .init(identifier: "pt"))
        
        ForgetPasswordView()
            .environment(\.locale, .init(identifier: "en"))
    }
}
