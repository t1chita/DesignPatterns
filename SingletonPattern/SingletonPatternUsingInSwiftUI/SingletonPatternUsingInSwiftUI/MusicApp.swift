//
//  MusicApp.swift
//  SingletonPatternUsingInSwiftUI
//
//  Created by Temur Chitashvili on 19.11.24.
//


import SwiftUI

@main
struct MusicApp: App {
    @StateObject private var userManager = UserManager.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userManager)
        }
    }
}