//
//  AuthController.swift
//  ChordShop
//
//  Created by Lucas Petrola on 15/09/23.
//

import Foundation
import Firebase
import FirebaseAuth

class AuthController {
    
    private let email: String!
    private let password: String?
    private let token: String?
    
    init(email: String!, password: String? = nil, token: String? = nil) {
        self.email = email
        self.password = password
        self.token = token
    }
    
    public func checkStudentKey (_ completion: @escaping () -> Void, isError: @escaping () -> Void) {
        guard let token = self.token else {return}
        
        let db = Firestore.firestore()
        let docRef = db.collection("student_keys").document(token)
        
        docRef.getDocument { document, error in
            guard error == nil else {return}
            guard let document = document else {return}
            
            if document.exists {
                completion()
            } else {
                isError()
            }
        }
    }
    
    public func signUp (_ completion: @escaping () -> Void, isError: @escaping () -> Void) {
        guard let token = self.token else {return}
        guard let password = self.password else {return}
        
        let isValidEmail = Validators().isValidEmail(self.email)
        
        guard isValidEmail else {
            isError()
            return
        }
        
        let db = Firestore.firestore()
        let docRef = db.collection("student_keys").document(token)
        
        Auth.auth().createUser(withEmail: self.email, password: password) {result, error in
            guard error == nil else {return}
            
            // If success update valid
            docRef.updateData(["valid": true]) { error in
                if let error = error {
                    print("Error updating document: \(error)")
                } else {
                    completion()
                }
            }
            
        }
    }
    
    public func signIn (_ completion: @escaping () -> Void) {
        
    }
    
    public func sendEmailVerification (_ completion: @escaping () -> Void) {
        Auth.auth().currentUser?.sendEmailVerification { error in
            if let error = error {
                print("Error on send email, with error \(String(describing: error))")
            } else {
                completion()
            }
        }
    }
    
    public func recoverEmail (_ completion: @escaping () -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                print("Error on recover email, with error \(String(describing: error))")
            } else {
                completion()
            }
        }
    }
}
