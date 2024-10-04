//
//  LoginViewModel.swift
//  Connect
//
//  Created by Aryan Sharma on 03/10/24.
//

import Foundation
import FirebaseAuth

extension SignInView {
    
    @Observable
    class ViewModel {
        let authManager: Authentication
        
        var email: String = ""
        var password: String = ""
        
        var errorMessage: String = ""
        
        init(authManager: Authentication = AuthManager()) {
            self.authManager = authManager
        }
        
        func signIn(success: @escaping (_ user: User) -> Void) {
            guard !email.isEmpty, !password.isEmpty else {
                errorMessage = "Fields can not be empty."
                return
            }
            
            Task {
                do {
                    let authDataResult = try await authManager.signInUser(with: email, and: password)
                    success(authDataResult.user)
                } catch {
                    let error = error as NSError
                    
                    
                    errorMessage = error.FIRAuthErrorUserDescription()
                    print("FIRAuth Error: \(error)")
                }
            }
        }
    }
}
