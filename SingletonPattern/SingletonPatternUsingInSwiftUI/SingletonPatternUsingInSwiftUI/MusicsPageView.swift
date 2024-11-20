//
//  MusicsPageView.swift
//  SingletonPatternUsingInSwiftUI
//
//  Created by Temur Chitashvili on 19.11.24.
//

import SwiftUI

struct FavouritesPageView: View {
    // Access shared `UserManager` to manage user data.
    @EnvironmentObject var userManager: UserManager

    // State variables for input fields to add a favorite music item.
    @State private var favouriteMusic = ""
    @State private var duration = ""
    @State private var author = ""

    var body: some View {
        VStack {
            // Input field for the name of the favorite music track.
            TextField("Music Name", text: $favouriteMusic)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            // Input field for the duration of the music track.
            TextField("Duration (seconds)", text: $duration)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            // Input field for the author of the music track.
            TextField("Author", text: $author)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            // Button to add the input music track to the user's list of favorites.
            Button("Add to Favourites") {
                if let duration = Int(duration) {
                    // Create a `Music` object and add it to the favorites list.
                    let music = Music(name: favouriteMusic, duration: duration, author: author)
                    userManager.addFavouriteMusic(music: music)
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()

            // Display a list of the user's favorite music tracks.
            if let favourites = userManager.user?.favourites {
                List(favourites, id: \.id) { music in
                    VStack(alignment: .leading) {
                        // Display the name of the music track.
                        Text(music.name)
                            .font(.headline)
                        
                        // Display the author of the music track.
                        Text("By \(music.author)")
                            .font(.subheadline)
                    }
                }
            }
        }
        // Set the navigation title for the favorites page.
        .navigationTitle("Favourites")
    }
}
