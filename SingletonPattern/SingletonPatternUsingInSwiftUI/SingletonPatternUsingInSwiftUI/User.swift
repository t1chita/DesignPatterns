//
//  User.swift
//  SingletonPatternUsingInSwiftUI
//
//  Created by Temur Chitashvili on 19.11.24.
//


import Foundation

// MARK: - User Model
// The `User` structure represents a user in the application.
struct User {
    let id = UUID().uuidString
    // A unique identifier for each user. It is automatically generated using UUID.

    let name: String
    // The name of the user. This property is required when creating a `User`.

    var favourites: [Music]
    // A list of the user's favorite music tracks. It is mutable, so tracks can be added or removed.

    var lastMusic: Music
    // The last music track the user played. This property keeps track of the most recent music.
}

// MARK: - Music Model
// The `Music` structure represents a music track in the application.
struct Music {
    let id = UUID().uuidString
    // A unique identifier for each music track. It is automatically generated using UUID.

    let name: String
    // The name of the music track.

    let duration: Int
    // The duration of the music track in seconds.

    let author: String
    // The name of the music track's author or artist.
}
