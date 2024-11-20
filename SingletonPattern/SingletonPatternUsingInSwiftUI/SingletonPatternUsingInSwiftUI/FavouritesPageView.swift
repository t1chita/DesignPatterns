//
//  FavouritesPageView.swift
//  SingletonPatternUsingInSwiftUI
//
//  Created by Temur Chitashvili on 19.11.24.
//

import SwiftUI

struct FavouritesPageView: View {
    @EnvironmentObject var userManager: UserManager
    @State private var favouriteMusic = ""
    @State private var duration = ""
    @State private var author = ""

    var body: some View {
        VStack {
            TextField("Music Name", text: $favouriteMusic)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Duration (seconds)", text: $duration)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Author", text: $author)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Add to Favourites") {
                if let duration = Int(duration) {
                    let music = Music(name: favouriteMusic, duration: duration, author: author)
                    userManager.addFavouriteMusic(music: music)
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()
            
            if let favourites = userManager.user?.favourites {
                List(favourites, id: \.id) { music in
                    VStack(alignment: .leading) {
                        Text(music.name)
                            .font(.headline)
                        Text("By \(music.author)").font(.subheadline)
                    }
                }
            }
        }
        .navigationTitle("Favourites")
    }
}
