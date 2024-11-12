import Foundation

// 1. Define the 'ChatMediator' protocol, which acts as the mediator interface.
//    - It requires any conforming class to implement the 'sendMessage' function.
protocol ChatMediator: AnyObject {
    func sendMessage(_ message: String, from user: User)
}

// 2. The 'ChatRoom' class conforms to the 'ChatMediator' protocol.
//    - It acts as the central mediator to facilitate communication between multiple users.
class ChatRoom: ChatMediator {
    // Store a list of users participating in the chat room.
    private var users: [User] = []
    
    // Method to add a user to the chat room.
    // - The newly added user gets assigned this chat room as its mediator.
    func addUser(_ user: User) {
        users.append(user)
        user.setMediator(self)
    }
    
    // Implement the required 'sendMessage' function from the 'ChatMediator' protocol.
    // - This sends the message from one user to all other users in the chat room.
    func sendMessage(_ message: String, from user: User) {
        for contact in users where contact !== user {
            // Send the message to all users except the one who sent it.
            contact.receiveMessage(message)
        }
    }
}

// 3. The 'User' class represents a participant in the chat room.
class User {
    private let name: String // Name of the user
    private weak var mediator: ChatMediator? // Reference to the chat mediator (ChatRoom)
    
    // Initialize the user with a name.
    init(name: String) {
        self.name = name
    }
    
    // Method to set the mediator (chat room).
    func setMediator(_ mediator: ChatMediator) {
        self.mediator = mediator
    }
    
    // Method called when this user receives a message.
    func receiveMessage(_ message: String) {
        print("\(name) received message: \(message)")
    }
    
    // Method to send a message to the chat room (mediator).
    func sendMessage(_ message: String) {
        print("\(name) sends: \(message)")
        mediator?.sendMessage(message, from: self)
    }
}

// 4. Example usage:

// Create a new chat room instance.
let chatRoom = ChatRoom()

// Create users who will join the chat room.
let user1 = User(name: "User 1")
let user2 = User(name: "User 2")
let user3 = User(name: "User 3")

// Add users to the chat room.
chatRoom.addUser(user1)
chatRoom.addUser(user2)
chatRoom.addUser(user3)

// 'User 1' sends a message to the chat room.
user1.sendMessage("Hello World")
