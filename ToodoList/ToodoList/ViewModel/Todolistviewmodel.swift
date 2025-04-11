//
//  Todolistviewmodel.swift
//  ToodoList
//
//  Created by Abdi Abera on 3/27/25.
//
import FirebaseFirestore
import Foundation
//this is for items view
class Todolistviewmodel: ObservableObject {
    @Published var showingNewItemView = false
    private let userId: String
    init(userId: String) {
        self.userId = userId
    }
    //deleting from database
    func delete(id: String){
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("Todo's")
            .document(id)
            .delete()
        
    }
}
