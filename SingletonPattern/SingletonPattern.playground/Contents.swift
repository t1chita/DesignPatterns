import Foundation

// MARK: - Models
/// Represents a user in the system.
struct User {
    let id = UUID().uuidString // Unique ID for the user
    let name: String           // Name of the user
    var favourites: [Music]    // List of the user's favourite music
    var lastMusic: Music       // The last music the user listened to
}

/// Represents a music item with its details.
struct Music {
    let id = UUID().uuidString // Unique ID for the music
    let name: String           // Name of the music
    let duration: Int          // Duration of the music in seconds
    let author: String         // Author or artist of the music
}

// MARK: - UserManager
/// Singleton class to manage user data.
/// Uses `@MainActor` to ensure thread-safety and main-thread access.
@MainActor
final class UserManager: Sendable {
    static let shared = UserManager() // Shared singleton instance
    
    var user: User? // The currently logged-in user
    
    private init() { } // Private initialiser to enforce singleton usage
    
    /// Registers a user and sets them as the current user.
    func registerUser(user: User) {
        self.user = user
        print("User Registered UserManager")
    }
    
    /// Adds a music item to the user's favorite list.
    func addFavouriteMusic(music: Music) {
        user?.favourites.append(music)
        print("Music Added In Favourites UserManager \(music)")
    }
    
    /// Updates the last music listened to by the user.
    func changeLastMusic(music: Music) {
        user?.lastMusic = music
        print("Last Music Changed UserManager \(music)")
    }
}

// MARK: - Pages
/// Represents the registration page logic.
final class RegistrationPage {
    /// Registers a user asynchronously.
    func registerUser(user: User) {
        Task {
            await UserManager.shared.registerUser(user: user)
        }
    }
}

/// Represents the favorites page logic.
final class FavouritesPage {
    /// Adds a music item to the user's favorites asynchronously.
    func addFavouriteMusic(music: Music) {
        Task {
            await UserManager.shared.addFavouriteMusic(music: music)
            print("Music Added In Favourites \(music)")
        }
    }
}

/// Represents the music page logic.
final class MusicsPage {
    /// Updates the last played music asynchronously.
    func changeLastMusic(music: Music) {
        Task {
            await UserManager.shared.changeLastMusic(music: music)
            print("Last Music Changed \(music)")
        }
    }
}

// MARK: - Testing Example
// Simulate user registration and interaction with favorite music.
let sampleMusic1 = Music(name: "Imagine", duration: 183, author: "John Lennon")
let sampleMusic2 = Music(name: "Bohemian Rhapsody", duration: 355, author: "Queen")

let sampleUser = User(
    name: "John Doe",
    favourites: [],
    lastMusic: sampleMusic1
)

// Instantiate pages to simulate user flow
let registrationPage = RegistrationPage()
let favouritesPage = FavouritesPage()
let musicsPage = MusicsPage()

// 1. Register the User
registrationPage.registerUser(user: sampleUser)

// Simulate some delay to allow async actions to complete
DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
    // 2. Add a favorite music
    favouritesPage.addFavouriteMusic(music: sampleMusic2)
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        // 3. Change the last played music
        musicsPage.changeLastMusic(music: sampleMusic2)
        
        // 4. Verify the final state
        Task {
            if let user = UserManager.shared.user {
                print("Final User Data:")
                print("Name: \(user.name)")
                print("Favourites: \(user.favourites.map { $0.name })")
                print("Last Music: \(user.lastMusic.name)")
            }
        }
    }
}
