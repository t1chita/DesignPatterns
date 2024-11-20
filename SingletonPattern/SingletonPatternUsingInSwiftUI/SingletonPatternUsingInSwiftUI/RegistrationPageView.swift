//
//  RegistrationPageView.swift
//  SingletonPatternUsingInSwiftUI
//
//  Created by Temur Chitashvili on 19.11.24.
//

import SwiftUI

struct RegistrationPageView: View {
    @EnvironmentObject var userManager: UserManager
    @State private var name = ""
    @State private var lastMusic = ""
    @State private var duration = ""
    @State private var author = ""
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Last Music", text: $lastMusic)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Duration (seconds)", text: $duration)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Author", text: $author)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Register") {
                if let duration = Int(duration) {
                    let music = Music(name: lastMusic, duration: duration, author: author)
                    let user = User(name: name, favourites: [], lastMusic: music)
                    userManager.registerUser(user: user)
                    dismiss() // Return to the home screen
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .navigationTitle("Register")
    }
}
