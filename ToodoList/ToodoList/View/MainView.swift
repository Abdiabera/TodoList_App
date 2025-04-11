//
//  ContentView.swift
//  ToodoList
//
//  Created by Abdi Abera on 3/27/25.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainviewviewModel()
    var body: some View {
        if viewModel.isSigned, !viewModel.currentUserId.isEmpty {
            //the state of singed in
            accountView
           
        }
        else {
            LoginView()
        }
    }
    @ViewBuilder
    var accountView: some View {
        TabView {
            // this gonna show the Home
            TodoListview(userId: viewModel.currentUserId)
                .tabItem
            { Label("Home", systemImage: "house")
            }
            //this gonna show the profile on the app
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
            }
        }
        
    }
}
struct ContentView_Previews: PreviewProvider{
    static var previews: some View {
        MainView()
    }
}

