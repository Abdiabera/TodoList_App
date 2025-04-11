//
//  Todolist.swift
//  ToodoList
//
//  Created by Abdi Abera on 3/27/25.
//

import Foundation
struct TodolistItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone : Bool
    mutating func setDone(_ state: Bool){
        isDone = state
    }
}


