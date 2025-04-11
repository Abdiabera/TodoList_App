//
//  TodoitemlistViewModel.swift
//  ToodoList
//
//  Created by Abdi Abera on 3/27/25.
//
import Firebase
import FirebaseFirestore
import FirebaseAuth
import Foundation
//this is for items view fir each row
class TodoitemlistViewModel: ObservableObject {
    //@Published var showNewItemView = false
    init() {}
    
    func toggleIsDone(item: TodolistItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("Todo's")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
        
        
        
    }
}
