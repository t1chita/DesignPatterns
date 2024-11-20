// UserManager.swift
// SingletonPatternUsingInSwiftUI
//
// Created by Temur Chitashvili on 19.11.24.

import Foundation

// MARK: - UserManager Class
// `UserManager` is a singleton class responsible for managing user-related data and actions.
// It ensures there is only one shared instance across the entire application.

// `@MainActor` ensures that all properties and methods of this class are executed on the main thread.
// This is crucial for updating the UI from within the class.
@MainActor
final class UserManager: ObservableObject {
    // MARK: Shared Instance
    static let shared = UserManager()
    // A shared instance of the `UserManager` class.
    // It uses the singleton pattern to ensure centralized data management.

    // MARK: Published Properties
    @Published var user: User?
    // A `User` object representing the currently registered user.
    // It is marked with `@Published` so that views observing this object are automatically updated when it changes.

    // MARK: Initializer
    private init() { }
    // The initializer is private to prevent creating multiple instances of `UserManager`.

    // MARK: Methods

    func registerUser(user: User) {
        // Registers a new user in the application.
        // - Parameter user: A `User` object containing the user's information.
        self.user = user
        // Set the `user` property to the provided `User` object.

        print("User Registered: \(user.name)")
        // Print a message to confirm the user registration.
    }

    func addFavouriteMusic(music: Music) {
        // Adds a music track to the user's favorites list.
        // - Parameter music: A `Music` object representing the track to be added.
        user?.favourites.append(music)
        // Append the new music track to the `favourites` array of the `user` property.

        print("Added to Favourites: \(music.name)")
        // Print a message to confirm the addition.
    }

    func changeLastMusic(music: Music) {
        // Updates the last played music for the user.
        // - Parameter music: A `Music` object representing the last played track.
        user?.lastMusic = music
        // Set the `lastMusic` property of the `user` to the provided `Music` object.

        print("Last Music Changed to: \(music.name)")
        // Print a message to confirm the change.
    }
}
