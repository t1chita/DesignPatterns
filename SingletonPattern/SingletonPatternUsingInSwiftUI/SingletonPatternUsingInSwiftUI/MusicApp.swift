//
//  MusicApp.swift
//  SingletonPatternUsingInSwiftUI
//
//  Created by Temur Chitashvili on 19.11.24.
//


import SwiftUI

// The main entry point for the application.
// SwiftUI's `@main` attribute marks this structure as the app's starting point.
@main
struct MusicApp: App {
    // Create a shared instance of `UserManager` using `@StateObject`.
    // `@StateObject` ensures the state is consistent across all views that use this environment object.
    @StateObject private var userManager = UserManager.shared

    var body: some Scene {
        WindowGroup {
            // Root view of the application is `ContentView`.
            // The `UserManager` instance is injected as an environment object so all child views can access it.
            ContentView()
                .environmentObject(userManager)
        }
    }
}
