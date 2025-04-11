//
//  MainviewviewModel.swift
//  ToodoList
//
//  Created by Abdi Abera on 3/27/25.
//
import FirebaseAuth
import Foundation

class MainviewviewModel: ObservableObject{
    @Published var currentUserId:  String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    init(){
        //when user sign in and out it triggered
        self.handler = Auth.auth().addStateDidChangeListener {
            [weak self] _, user in DispatchQueue.main.async { self?.currentUserId = user?.uid ?? ""
                
            }
        }
    }
    public var isSigned: Bool {
        return Auth.auth().currentUser != nil
    }
    
}
