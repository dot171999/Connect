//
//  Router.swift
//  Connect
//
//  Created by Aryan Sharma on 04/10/24.
//

import Foundation
import SwiftUI

@Observable
final class Router {
    var path: NavigationPath = NavigationPath()
    
    public enum Destination: Codable, Hashable {
        case signInScreen
        case newAccountScreen
        case homeScreen
    }
    
    func navigate(to destination: Destination) {
        path.append(destination)
    }
    
    func goBack() {
        path.removeLast()
    }
    
    func goToRoot() {
        path = NavigationPath()
    }
}
