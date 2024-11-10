import Foundation

protocol ChatMediator {
    func sendMessage(_ message: String, from user: User)
}

class ChatRoom: ChatMediator {
    private var users: [User] = []
    
    func addUser(_ user: User) {
        users.append(user)
        user.setMediator(self)
    }
    
    func sendMessage(_ message: String, from user: User) {
        for contact in users where contact !== user {
            contact.receiveMessage(message)
        }
    }
}

class User {
    private let name: String
    private var mediator: ChatMediator?
    
    init(name: String) {
        self.name = name
    }
    
    func setMediator(_ mediator: ChatMediator) {
        self.mediator = mediator
    }
    
    func receiveMessage(_ message: String) {
        print("\(name) received message: \(message)")
    }
    
    func sendMessage(_ message: String) {
        print("\(name) sends: \(message)")
        mediator?.sendMessage(message, from: self)
    }
}

let chatRoom = ChatRoom()

let user1 = User(name: "User 1")
let user2 = User(name: "User 2")
let user3 = User(name: "User 3")

chatRoom.addUser(user1)
chatRoom.addUser(user2)
chatRoom.addUser(user3)

user1.sendMessage("Hello World")
