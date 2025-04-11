//
//  todoButton.swift
//  ToodoList
//
//  Created by Abdi Abera on 3/28/25.
//

import SwiftUI

struct todoButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10).foregroundColor(background)
                Text(title) .foregroundColor(Color.white).bold()
            }
        } .padding()
    }
}

struct todoButton_previews: PreviewProvider {
    static var previews: some View {
        
        todoButton(title: "Value", background: .orange) {
            //action
            
        }
    }
}
