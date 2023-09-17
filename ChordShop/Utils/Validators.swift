//
//  Validators.swift
//  ChordShop
//
//  Created by Lucas Petrola on 15/09/23.
//

import Foundation

class Validators {
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    public func isDisabled(token: String, email: String, password: String, checked: Bool) -> Bool {
        return (
            token.isEmpty ||
            email.isEmpty ||
            password.isEmpty ||
            !checked
        )
    }
    
    public func isDisabledSocialMedia(token: String, checked: Bool) -> Bool {
        return (
            token.isEmpty ||
            !checked
        )
    }
}
