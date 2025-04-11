//
//  ToodoListApp.swift
//  ToodoList
//
//  Created by Abdi Abera on 3/27/25.
//
import FirebaseCore
import SwiftUI

@main
struct ToodoListApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
