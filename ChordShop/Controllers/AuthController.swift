//
//  AuthController.swift
//  ChordShop
//
//  Created by Lucas Petrola on 15/09/23.
//

import Foundation
import Firebase
import FirebaseAuth
import LocalAuthentication

class AuthController {
    
    private let email: String?
    private let password: String?
    private let token: String?
    
    private let db = Firestore.firestore()
    
    init(email: String? = nil, password: String? = nil, token: String? = nil) {
        self.email = email
        self.password = password
        self.token = token
    }
    
    public func checkStudentKey (_ completion: @escaping () -> Void, isError: @escaping () -> Void) {
        guard let token = self.token else {return}
        let docRef = self.db.collection("student_keys").document(token)
        
        docRef.getDocument { document, error in
            guard error == nil else {return}
            guard let document = document else {return}
            
            if !document.exists {
                isError()
                return
            }
            
            completion()
        }
    }
    
    public func signUp (_ completion: @escaping () -> Void, isError: @escaping () -> Void) {
        guard let token = self.token else {return}
        guard let password = self.password else {return}
        guard let email = self.email else {return}
        
        let isValidEmail = Validators().isValidEmail(email)
        
        guard isValidEmail else {
            isError()
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) {result, error in
            guard error == nil else {return}
            
            self.updateUserDataFromDBStore(token: token) {
                completion()
            }
        }
    }
    
    private func updateUserDataFromDBStore(token: String, completion: @escaping () -> Void) {
        let docRef = self.db.collection("student_keys").document(token)
        let user = Auth.auth().currentUser
        
        guard let uid = user?.uid else {return}
        
        docRef.updateData(["valid": true, "uid": uid]) { error in
            if error != nil {
                return
            }
            
            completion()
        }
    }
    
    public func signIn (_ completion: @escaping () -> Void, isError: @escaping () -> Void, isVerifiedEmailError: @escaping () -> Void) {
        guard let email = self.email else {return}
        guard let password = self.password else {return}
        
        let isValidEmail = Validators().isValidEmail(email)
        guard isValidEmail else {
            isError()
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            guard error == nil else {
                isError()
                return
            }
            
            if Auth.auth().currentUser?.isEmailVerified == false {
                isVerifiedEmailError()
                return
            }
            
            completion()
        }
    }
    
    public func sendEmailVerification (_ completion: @escaping () -> Void) {
        Auth.auth().currentUser?.sendEmailVerification { error in
            if error != nil {
                return
            }
            
            completion()
        }
    }
    
    public func recoverEmail (_ completion: @escaping () -> Void, isError: @escaping () -> Void?) {
        guard let email = self.email else {return}
        
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if error != nil {
                isError()
                return
            }
            
            completion()
        }
    }
    
    public func handleUserLogged (_ completion: @escaping () -> Void) {
        let user = Auth.auth().currentUser
        
        if (user != nil) {
            BiometryAuthentication {
                completion()
            }
        }
    }
    
    public func BiometryAuthentication(_ completion: @escaping () -> Void) {
        let context = LAContext()
        var error: NSError?

        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "login_biometrics_reason"

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    completion()
                }
            }
        }
    }
}
