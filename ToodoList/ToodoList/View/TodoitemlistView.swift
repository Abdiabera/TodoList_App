//
//  TodoitemlistView.swift
//  ToodoList
//
//  Created by Abdi Abera on 3/27/25.
//

import SwiftUI

struct TodoitemlistView: View {
    @StateObject var viewModel = TodoitemlistViewModel()
    let item: TodolistItem
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(item.title)
                
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
                
            }
            Spacer()
            Button {
                viewModel.toggleIsDone(item: item)
                }
            label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.blue)
            }
        }
    }
}

struct TodoitemlistView_previews: PreviewProvider {
    static var previews: some View {
        TodoitemlistView(item: .init(id: "123", title: "Get Butter", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: true))
    }
}
