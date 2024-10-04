//
//  AuthManager.swift
//  Connect
//
//  Created by Aryan Sharma on 03/10/24.
//

import Foundation
import Firebase
import FirebaseAuth

protocol Authentication {
    func createNewUser(with email: String, and password: String) async throws -> AuthDataResult
    func signInUser(with email: String, and password: String) async throws -> AuthDataResult
}

class AuthManager: Authentication {
    func signInUser(with email: String, and password: String) async throws -> AuthDataResult {
        try await Auth.auth().signIn(withEmail: email, password: password)
    }
    
    func createNewUser(with email: String, and password: String) async throws -> AuthDataResult {
        try await Auth.auth().createUser(withEmail: email, password: password)
    }
}
