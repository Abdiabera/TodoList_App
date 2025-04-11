//
//  LoginViewModel.swift
//  ToodoList
//
//  Created by Abdi Abera on 3/28/25.
//
import FirebaseAuth
import Foundation
class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){
        
    }
    func login() {
        guard validate() else {
            return
            
        }
        
        // trying to sign in
        Auth.auth().signIn(withEmail: email, password: password)
       
    }
    private func validate () -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
            
        }
        //Eamil@.com
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please Enter Valid Email"
            return false
        }
        return true
    }
}
