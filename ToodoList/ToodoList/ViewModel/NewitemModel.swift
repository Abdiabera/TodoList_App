//
//  NewitemModel.swift
//  ToodoList
//
//  Created by Abdi Abera on 3/27/25.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
import FirebaseFirestore
class NewitemModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    
    init() {
        
    }
    func save(){
    
        guard canSave else {
            return
        }
        //get current userid
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        //create the model
        let newId = UUID().uuidString
        let newItem = TodolistItem(id: newId,
                                   title: title,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createdDate: Date().timeIntervalSince1970,
                                   isDone: false)
    
        //then we have to save
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("Todo's")
            .document(newId)
            .setData(newItem.asDictionary())
        
    }
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        // if due date is greater than today
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
}
