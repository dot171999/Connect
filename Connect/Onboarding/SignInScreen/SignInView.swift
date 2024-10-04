//
//  SignInView.swift
//  Connect
//
//  Created by Aryan Sharma on 03/10/24.
//

import SwiftUI
import SwiftData

struct SignInView: View {
    @Environment(\.colorScheme) private var colorScheme
    @Environment(Router.self) private var router
    @State private var viewModel = ViewModel()
    
    var body: some View {
        VStack(alignment: .center) {
            Image("App")
                .resizable()
                .frame(width: 100, height: 100)
                .shadow(color: .white, radius: colorScheme == .dark ? 2 : 0)
                .padding(.top, 50)
            
            Spacer()
            
            VStack {
                Text(viewModel.errorMessage)
                    .foregroundStyle(.red)
                
                TextField("Email", text: $viewModel.email)
                    .padding()
                    .background(Rectangle().stroke(lineWidth: 1))
                    .background()
                
                SecureField("Password", text: $viewModel.password)
                    .padding()
                
                
                Button(action: {
                    viewModel.signIn { user in
                        router.navigate(to: .homeScreen)
                    }
                }, label: {
                    Image(systemName: "arrow.right")
                        .imageScale(.large)
                    
                    Text("Go")
                        .font(.title)
                })
                .padding()
                
            }
            .padding(50)
            
            HStack {
                NavigationLink {
                    
                } label: {
                    Text("Forgot password")
                        .font(.headline)
                }
                
                Text("|")
                
                NavigationLink {
                    NewAccountView()
                } label: {
                    Text("Don't have an account")
                        .font(.headline)
                }
            }
            .padding(.bottom)
        }
        .padding(.top)
        .navigationTitle("Sign In")
        .toolbarBackground(colorScheme == .dark ? .black : .white, for: .navigationBar)
    }
}

#Preview {
    NavigationStack {
        SignInView()
    }
    .environment(Router())
}

