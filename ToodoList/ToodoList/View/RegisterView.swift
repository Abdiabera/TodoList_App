//
//  RegisterView.swift
//  ToodoList
//
//  Created by Abdi Abera on 3/27/25.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        VStack {
            //header
            HeaderView(title: "Register", subtitle: "Get Start Organizing todo's", angle: -15, background: .orange)
            Form {
                TextField("Full Name", text: $viewModel.name).textFieldStyle(DefaultTextFieldStyle()).autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email).textFieldStyle(DefaultTextFieldStyle()).autocapitalization(.none)
                    .autocapitalization(.none)
                SecureField("Password", text: $viewModel.password).textFieldStyle(DefaultTextFieldStyle())
                todoButton(title: "Create Account", background: .green){
                    //trying to Register
                    viewModel.register()
                }
                .padding()
            }
            .offset(y: -50)
            Spacer()
        }
    }
}

struct RegisterView_previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
