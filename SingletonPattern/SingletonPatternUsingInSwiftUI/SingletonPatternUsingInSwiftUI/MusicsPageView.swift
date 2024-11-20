//
//  MusicsPageView.swift
//  SingletonPatternUsingInSwiftUI
//
//  Created by Temur Chitashvili on 19.11.24.
//

import SwiftUI

struct MusicsPageView: View {
    @EnvironmentObject var userManager: UserManager
    @State private var lastMusic = ""
    @State private var duration = ""
    @State private var author = ""

    var body: some View {
        VStack {
            TextField("Music Name", text: $lastMusic)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Duration (seconds)", text: $duration)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Author", text: $author)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Change Last Music") {
                if let duration = Int(duration) {
                    let music = Music(name: lastMusic, duration: duration, author: author)
                    userManager.changeLastMusic(music: music)
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()
            
            if let lastMusic = userManager.user?.lastMusic {
                VStack {
                    Text("Last Music: \(lastMusic.name)")
                        .font(.headline)
                    Text("By \(lastMusic.author)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
            }
        }
        .navigationTitle("Music Library")
    }
}
