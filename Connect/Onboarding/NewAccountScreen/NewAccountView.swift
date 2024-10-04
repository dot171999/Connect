//
//  NewAccountView.swift
//  Connect
//
//  Created by Aryan Sharma on 03/10/24.
//

import SwiftUI

struct NewAccountView: View {
    @Environment(\.colorScheme) private var colorScheme
    @Environment(Router.self) private var router
    
    @State private var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            Image("App")
                .resizable()
                .frame(width: 100, height: 100)
                .shadow(color: .white, radius: colorScheme == .dark ? 2 : 0)
                .padding(.top, 50)
            
            Spacer()
            
            VStack {
                Text(viewModel.errorMessage)
                    .foregroundStyle(.red)
                
                Group {
                    TextField("Name", text: $viewModel.name)
                    TextField("Email", text: $viewModel.email)
                }
                .padding()
                .background(Rectangle().stroke(lineWidth: 1))
                
                SecureField("Password", text: $viewModel.password)
                    .padding()
                    
                Button(action: {
                    viewModel.createNewUser { newUser in
                        router.navigate(to: .homeScreen)
                    }
                }, label: {
                    Image(systemName: "arrow.right")
                        .imageScale(.large)
                    Text("Create")
                        .font(.title)
                })
                .padding()
            }
            .padding(50)
        }
        .navigationTitle("New account")
        .navigationBarTitleDisplayMode(.large)
        .toolbarBackground(colorScheme == .dark ? .black : .white, for: .navigationBar)
    }
}

#Preview {
    NavigationStack {
        NewAccountView()
    }
    .environment(Router())
}
