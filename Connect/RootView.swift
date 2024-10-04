//
//  RootView.swift
//  Connect
//
//  Created by Aryan Sharma on 04/10/24.
//

import SwiftUI

struct RootView: View {
    @State var router: Router = Router()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            SignInView()
                .navigationDestination(for: Router.Destination.self) { destination in
                    let dest: Router.Destination = destination
                    
                    switch dest {
                    case .signInScreen:
                        SignInView()
                    case .newAccountScreen:
                        NewAccountView()
                    case .homeScreen:
                        HomeView()
                    }
                }
        }
        .environment(router)
    }
}

#Preview {
    RootView()
}
