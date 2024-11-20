//
//  UserManager.swift
//  SingletonPatternUsingInSwiftUI
//
//  Created by Temur Chitashvili on 19.11.24.
//


import Foundation

@MainActor
final class UserManager: ObservableObject {
    static let shared = UserManager()
    
    @Published var user: User?
    
    private init() { }
    
    func registerUser(user: User) {
        self.user = user
        print("User Registered: \(user.name)")
    }
    
    func addFavouriteMusic(music: Music) {
        user?.favourites.append(music)
        print("Added to Favourites: \(music.name)")
    }
    
    func changeLastMusic(music: Music) {
        user?.lastMusic = music
        print("Last Music Changed to: \(music.name)")
    }
}
