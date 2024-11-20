//
//  ContentView.swift
//  SingletonPatternUsingInSwiftUI
//
//  Created by Temur Chitashvili on 19.11.24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userManager: UserManager

    var body: some View {
        NavigationStack {
            VStack {
                if let user = userManager.user {
                    Text("Welcome, \(user.name)!")
                        .font(.title)
                        .padding()
                    
                    NavigationLink("Go to Favourites", destination: FavouritesPageView())
                        .buttonStyle(.borderedProminent)
                        .padding()
                    
                    NavigationLink("Go to Music Library", destination: MusicsPageView())
                        .buttonStyle(.bordered)
                        .padding()
                } else {
                    NavigationLink("Register", destination: RegistrationPageView())
                        .buttonStyle(.borderedProminent)
                        .padding()
                }
            }
            .navigationTitle("Home")
        }
    }
}
