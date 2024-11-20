//
//  ContentView.swift
//  SingletonPatternUsingInSwiftUI
//
//  Created by Temur Chitashvili on 19.11.24.
//

import SwiftUI

struct ContentView: View {
    // Access the shared `UserManager` instance provided through the environment.
    @EnvironmentObject var userManager: UserManager

    var body: some View {
        // Use `NavigationStack` for declarative navigation between pages.
        NavigationStack {
            VStack {
                // Check if a user is registered.
                // If `userManager.user` exists, show a welcome message and navigation options.
                if let user = userManager.user {
                    // Display a personalized greeting for the registered user.
                    Text("Welcome, \(user.name)!")
                        .font(.title) // Set the text to a large, prominent font style.
                        .padding() // Add spacing around the text.

                    // Navigation link to navigate to the "Favourites" page.
                    NavigationLink("Go to Favourites", destination: FavouritesPageView())
                        .buttonStyle(.borderedProminent) // Style the button with emphasis.
                        .padding()

                    // Navigation link to navigate to the "Music Library" page.
                    NavigationLink("Go to Music Library", destination: MusicsPageView())
                        .buttonStyle(.bordered) // Style the button as a less prominent option.
                        .padding()
                } else {
                    // If no user is registered, show a button to navigate to the registration page.
                    NavigationLink("Register", destination: RegistrationPageView())
                        .buttonStyle(.borderedProminent)
                        .padding()
                }
            }
            // Set the navigation title to appear on the top of the screen.
            .navigationTitle("Home")
        }
    }
}

