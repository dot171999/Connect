//
//  NSError+FIRAuthErrors.swift
//  Connect
//
//  Created by Aryan Sharma on 04/10/24.
//

import Foundation
import FirebaseAuth

extension NSError {
    func FIRAuthErrorUserDescription() -> String {
        switch AuthErrorCode(rawValue: self.code) {
            
        case .accountExistsWithDifferentCredential:
            return "Account linking is required."
        case .adminRestrictedOperation:
            return "The operation is admin restricted."
        case .appNotAuthorized:
            return "The app is not authorized to use Firebase Authentication with the provided API Key."
        case .appNotVerified:
            return "The app could not be verified by Firebase during phone number authentication."
        case .appVerificationUserInteractionFailure:
            return "A general failure occurred during the app verification flow."
        case .captchaCheckFailed:
            return "The reCAPTCHA token is not valid."
        case .credentialAlreadyInUse:
            return "An attempt to link with a credential that has already been linked with a different Firebase account."
        case .customTokenMismatch:
            return "The service account and the API key belong to different projects."
        case .dynamicLinkNotActivated:
            return "A Firebase Dynamic Link is not activated."
        case .emailAlreadyInUse:
            return "The email used to attempt a sign-up is already in use."
        case .emailChangeNeedsVerification:
            return "A verified email is required to change to."
        case .expiredActionCode:
            return "The OOB code is expired."
        case .gameKitNotLinked:
            return "The GameKit framework is not linked prior to attempting Game Center sign-in."
        case .internalError:
            return "An internal error occurred."
        case .invalidActionCode:
            return "The OOB code is invalid."
        case .invalidAPIKey:
            return "An invalid API key was supplied in the request."
        case .invalidAppCredential:
            return "An invalid APNS device token was used in the verifyClient request."
        case .invalidClientID:
            return "The clientID used to invoke a web flow is invalid."
        case .invalidContinueURI:
            return "The domain specified in the continue URI is not valid."
        case .invalidCredential:
            return "The IDP token or requestUri is invalid."
        case .invalidCustomToken:
            return "There was a validation error with the custom token."
        case .invalidDynamicLinkDomain:
            return "The Firebase Dynamic Link domain used is either not configured or unauthorized for the current project."
        case .invalidEmail:
            return "The email is invalid."
        case .invalidMessagePayload:
            return "There are invalid parameters in the payload during a 'send password reset email' attempt."
        case .invalidMultiFactorSession:
            return "The multi-factor session is invalid."
        case .invalidPhoneNumber:
            return "An invalid phone number was provided in a call to verifyPhoneNumber:completion."
        case .invalidProviderID:
            return "The given provider ID for a web operation is invalid."
        case .invalidRecipientEmail:
            return "The recipient email is invalid."
        case .invalidSender:
            return "The sender email is invalid during a 'send password reset email' attempt."
        case .invalidUserToken:
            return "The user’s saved auth credential is invalid; the user needs to sign in again."
        case .invalidVerificationCode:
            return "An invalid verification code was used in the verifyPhoneNumber request."
        case .invalidVerificationID:
            return "An invalid verification ID was used in the verifyPhoneNumber request."
        case .keychainError:
            return "An error occurred while attempting to access the keychain."
        case .localPlayerNotAuthenticated:
            return "The local player was not authenticated prior to attempting Game Center sign-in."
        case .maximumSecondFactorCountExceeded:
            return "The maximum second factor count is exceeded."
        case .malformedJWT:
            return "A JWT failed to parse correctly. May be accompanied by an underlying error describing which step of the JWT parsing process failed."
        case .missingAndroidPackageName:
            return "The android package name is missing when the androidInstallApp flag is set to true."
        case .missingAppCredential:
            return "The APNS device token is missing in the verifyClient request."
        case .missingAppToken:
            return "The APNs device token could not be obtained. The app may not have set up remote notification correctly or may fail to forward the APNs device token to FIRAuth if app delegate swizzling is disabled."
        case .missingContinueURI:
            return "A continue URI was not provided in a request to the backend which requires one."
        case .missingClientIdentifier:
            return "An error for when the client identifier is missing."
        case .missingEmail:
            return "An email address was expected but one was not provided."
        case .missingIosBundleID:
            return "The iOS bundle ID is missing when an iOS App Store ID is provided."
        case .missingMultiFactorSession:
            return "The multi-factor session is missing."
        case .missingOrInvalidNonce:
            return "The nonce is missing or invalid."
        case .missingPhoneNumber:
            return "A phone number was not provided in a call to verifyPhoneNumber:completion."
        case .missingVerificationCode:
            return "The phone auth credential was created with an empty verification code."
        case .missingVerificationID:
            return "The phone auth credential was created with an empty verification ID."
        case .missingMultiFactorInfo:
            return "The multi-factor info is missing."
        case .multiFactorInfoNotFound:
            return "The multi-factor info is not found."
        case .networkError:
            return "A network error occurred (such as a timeout, interrupted connection, or unreachable host). These types of errors are often recoverable with a retry. The NSUnderlyingError field in the NSError.userInfo dictionary will contain the error encountered."
        case .noSuchProvider:
            return "An attempt was made to unlink a provider that is not linked."
        case .notificationNotForwarded:
            return "The app fails to forward remote notification to FIRAuth."
        case .nullUser:
            return "A non-null user was expected as an argument to the operation but a null user was provided."
        case .operationNotAllowed:
            return "The administrator disabled sign in with the specified identity provider."
        case .providerAlreadyLinked:
            return "An attempt was made to link a provider to which the account is already linked."
        case .quotaExceeded:
            return "The quota of SMS messages for a given project has been exceeded."
        case .rejectedCredential:
            return "The credential is rejected because it’s misformed or mismatching."
        case .requiresRecentLogin:
            return "The user has attempted to change email or password more than 5 minutes after signing in."
        case .secondFactorAlreadyEnrolled:
            return "The second factor is already enrolled."
        case .secondFactorRequired:
            return "The second factor is required for sign-in."
        case .sessionExpired:
            return "The SMS code has expired."
        case .tooManyRequests:
            return "Too many requests were made to a server method."
        case .unauthorizedDomain:
            return "The domain specified in the continue URL is not whitelisted in the Firebase console."
        case .unsupportedFirstFactor:
            return "The first factor is not supported."
        case .unverifiedEmail:
            return "The email is required for verification."
        case .userDisabled:
            return "The user’s account is disabled on the server."
        case .userMismatch:
            return "An attempt was made to reauthenticate with a user which is not the current user."
        case .userNotFound:
            return "The user account was not found."
        case .userTokenExpired:
            return "The saved token has expired; for example, the user may have changed account password on another device. The user needs to sign in again on the device that made this request."
        case .weakPassword:
            return "An attempt was made to set a password that is considered too weak."
        case .webContextAlreadyPresented:
            return "An attempt was made to present a new web context while one was already being presented."
        case .webContextCancelled:
            return "The URL presentation was cancelled prematurely by the user."
        case .webInternalError:
            return "An internal error occurred within a SFSafariViewController or WKWebView."
        case .webNetworkRequestFailed:
            return "A network request within a SFSafariViewController or WKWebView failed."
        case .wrongPassword:
            return "The user attempted sign in with a wrong password."
        case .webSignInUserInteractionFailure:
            return "A general failure occurred during a web sign-in flow."
        default:
            return "An unknown error occurred."
        }

    }
}
