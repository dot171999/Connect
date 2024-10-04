//
//  NewAccountViewModel.swift
//  Connect
//
//  Created by Aryan Sharma on 03/10/24.
//

import Foundation
import Firebase
import FirebaseAuth

extension NewAccountView {
     
    @Observable
    class ViewModel {
        let authManager: Authentication
        
        var name: String = ""
        var email: String = ""
        var password: String = ""
        
        private(set) var errorMessage: String = ""
        
        init(authManager: Authentication = AuthManager()) {
            self.authManager = authManager
        }
        
        func createNewUser(success: @escaping (_ newUser: User) -> Void) {
            guard !name.isEmpty, !email.isEmpty, !password.isEmpty else {
                errorMessage = "Fields can not be empty."
                return
            }
            
            Task {
                do {
                    let authDataResult = try await authManager.createNewUser(with: email, and: password)
                    success(authDataResult.user)
                } catch {
                    let error = error as NSError
                    let errorCode = AuthErrorCode(rawValue: error.code)
                    
                    switch errorCode {
                    case .emailAlreadyInUse:
                        // Call fetchProvidersForEmail to check which sign-in mechanisms such user used.
                        errorMessage = error.FIRAuthErrorUserDescription()
                    case .weakPassword:
                        errorMessage = error.userInfo[NSLocalizedFailureReasonErrorKey] as? String ?? ""
                    default:
                        errorMessage = error.FIRAuthErrorUserDescription()
                    }
                    print("FIRAuth Error: \(error)")
                }
            }
        }
    }
}
