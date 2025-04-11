//
//  ToodolistitemView.swift
//  ToodoList
//
//  Created by Abdi Abera on 3/27/25.
//

import SwiftUI
import FirebaseFirestore
import Firebase
struct TodoListview: View {
    @StateObject var viewModel: Todolistviewmodel
    @FirestoreQuery var items: [TodolistItem]
    
    init(userId: String){
        // usersid todo
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/Todo's")
        self._viewModel = StateObject(wrappedValue: Todolistviewmodel(userId: userId))
    }
    var body: some View {
        NavigationView {
            VStack {
                List(items){ item in
                    TodoitemlistView(item: item)
                        .swipeActions {
                           
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                            }
                        .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    //actions
                    viewModel.showingNewItemView = true
                    
                } label: {
                    Image (systemName: "plus")
                    
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView)
            {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct TodoListview_previews: PreviewProvider {
    static var previews: some View {
        TodoListview(userId: "/users/oJGfPrPvGlgUsOfEbhm5ghYng2R2")
    }
}
