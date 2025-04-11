//
//  NewItemView.swift
//  ToodoList
//
//  Created by Abdi Abera on 3/27/25.
//

import SwiftUI
struct NewItemView: View {
    @StateObject var viewModel = NewitemModel()
    @Binding var newItemPresented : Bool
    var body: some View {
        VStack {
            Text ("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top,  100)
            Form {
                //this is the title
                TextField("Title", text: $viewModel.title).textFieldStyle(DefaultTextFieldStyle())
               //This is the DUe date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                //this is the button
                todoButton(title: "Save",
                           background: .pink) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    }
                    else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text ("Error"), message: Text ( "Please fill all fields and select due date newer than the minutes of now or fill in for tommorow"))
            }
        }
    }
}

struct NewItemView_previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
            
        }, set: { _ in
            
        } ))
    }
}
