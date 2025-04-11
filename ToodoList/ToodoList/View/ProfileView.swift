//
//  ProfileView.swift
//  ToodoList
//
//  Created by Abdi Abera on 3/27/25.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    var body: some View {
        NavigationView {
            VStack{
                if let user = viewModel.user {
                    profile(user: user)
                    
                }else {
                Text("Loading Profile...")
            }
        }
                    
            .navigationTitle("Profile")
        }
        .onAppear{
            print("👀 ProfileView appeared")
            viewModel.fetchUser()
        }
    }
    @ViewBuilder
        func profile(user: User) -> some View {
            //we have to use avatar image
            Image(systemName: "person.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.blue)
                .frame(width: 125, height: 125)
                .padding()
            //info for example name, email,number
            VStack (alignment: .leading) {
                HStack {
                    Text("Name:" )
                        .bold()
                    Text(user.name)
                }
                .padding()
                
                HStack{
                    Text("Email: ")
                        .bold()
                    Text(user.email)
                }
                .padding()
                HStack{
                    Text("Member Since: ")
                        .bold()
                    Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                }
                .padding()
            }
            .padding()
            //this place is SIGNOUT
            Button("Log Out") {
                
                viewModel.logOut()
            }
            .tint(.red)
            .padding()
            Spacer()
        }
        
        }
struct ProfileView_previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
