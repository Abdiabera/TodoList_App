//
//  LoginView.swift
//  ToodoList
//
//  Created by Abdi Abera on 3/27/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewmodel = LoginViewModel()
    var body: some View {
        NavigationView{
            VStack {
                //let we say header
                HeaderView(title: "To Do List", subtitle: "Get things Done", angle: 15, background: .pink)
                
                //Login form
                Form {
                    if !viewmodel.errorMessage.isEmpty {
                        Text(viewmodel.errorMessage).foregroundColor(Color.red)
                    }
                    TextField ("Email Address", text: $viewmodel.email).textFieldStyle(RoundedBorderTextFieldStyle()).autocapitalization(.none)
                    SecureField("Password", text: $viewmodel.password).textFieldStyle(RoundedBorderTextFieldStyle())
                    todoButton(title: "Log In", background: .blue){
                        //trying to login
                        viewmodel.login()
                    }
                    .padding()
                }
                .offset(y: -50)
                
                //create new account
                
                VStack {
                    Text("New Around here ?")
                    NavigationLink("Create An Account", destination: RegisterView())
                        // we have to show the registrtation
                    
                } .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

struct LoginView_previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
    
}
