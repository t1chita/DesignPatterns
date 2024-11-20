//
//  RegistrationPageView.swift
//  SingletonPatternUsingInSwiftUI
//
//  Created by Temur Chitashvili on 19.11.24.
//

import SwiftUI

struct RegistrationPageView: View {
    // Access `UserManager` to update user data upon registration.
    @EnvironmentObject var userManager: UserManager

    // State variables to hold user input for registration details.
    @State private var name = "" // User's name.
    @State private var lastMusic = "" // Name of the last music track the user listened to.
    @State private var duration = "" // Duration of the last music track (in seconds).
    @State private var author = "" // Author of the last music track.

    // Environment variable to dismiss the current view after registration is complete.
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            // Input field for the user's name.
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle()) // Apply a modern border style.
                .padding() // Add spacing around the input field.

            // Input field for the name of the last music track.
            TextField("Last Music", text: $lastMusic)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            // Input field for the duration of the last music track.
            // Limit the keyboard input to numbers using `.keyboardType(.numberPad)`.
            TextField("Duration (seconds)", text: $duration)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            // Input field for the author of the last music track.
            TextField("Author", text: $author)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            // Button to register the user with the provided details.
            Button("Register") {
                // Ensure the duration can be converted to an integer.
                if let duration = Int(duration) {
                    // Create a `Music` object for the last music track.
                    let music = Music(name: lastMusic, duration: duration, author: author)

                    // Create a `User` object with the provided information.
                    let user = User(name: name, favourites: [], lastMusic: music)

                    // Register the user using the `UserManager`.
                    userManager.registerUser(user: user)

                    // Dismiss the registration view to return to the home page.
                    dismiss()
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        // Set the navigation title for the registration page.
        .navigationTitle("Register")
    }
}
