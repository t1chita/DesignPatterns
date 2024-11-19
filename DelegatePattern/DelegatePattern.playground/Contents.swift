import Foundation

// MARK: - Protocol Definition
/// A protocol defining tasks that can be delegated
protocol Work: AnyObject {
    func emailManagement()
    func researchNews()
    func organizeMeetingAgenda()
}

// MARK: - Boss Class
/// A class representing a Boss who delegates tasks to their assistant
final class Boss {
    /// Delegate property conforming to the `Work` protocol
    /// This is weak to avoid a strong reference cycle
    weak var delegate: Work?

    /// Simulate assigning tasks
    func assignTasks() {
        print("Boss: Let's delegate tasks to my assistant.\n")
        delegate?.emailManagement() // Delegate task 1
        delegate?.researchNews()    // Delegate task 2
        delegate?.organizeMeetingAgenda() // Delegate task 3
    }
}

// MARK: - Assistant Class
/// A class representing an Assistant who performs tasks assigned by the boss
final class Assistant: Work {
    /// Implementation of managing emails
    func emailManagement() {
        print("Assistant: Managing today's emails as assigned by the boss.")
    }
    
    /// Implementation of researching news
    func researchNews() {
        print("Assistant: Researched the latest news from last week.")
    }
    
    /// Implementation of organizing meeting agendas
    func organizeMeetingAgenda() {
        print("Assistant: Organized the agenda for the next team meeting.")
    }
}

// MARK: - Example of Delegation in Action

// Create an instance of `Boss`
let jonathanBoss = Boss()

// Uncommenting the next line will demonstrate the error handling scenario:
// jonathanBoss.assignTasks()

// Create an instance of `Assistant`
let mikeAssistant = Assistant()

// Assign the assistant as the delegate of the boss
jonathanBoss.delegate = mikeAssistant

// Simulate assigning tasks
jonathanBoss.assignTasks()

// MARK: - Error Handling Example
/// A function to simulate when no delegate is assigned
func performTaskWithoutDelegate(boss: Boss) {
    if boss.delegate == nil {
        print("\nWarning: No assistant is assigned to perform tasks!")
    }
}

performTaskWithoutDelegate(boss: jonathanBoss)

// MARK: - Adding Another Delegate Example

/// A new class that conforms to the `Work` protocol
final class Intern: Work {
    func emailManagement() {
        print("Intern: Helping manage today's emails.")
    }
    
    func researchNews() {
        print("Intern: Researched news about industry trends.")
    }
    
    func organizeMeetingAgenda() {
        print("Intern: Drafted an initial agenda for the meeting.")
    }
}

// Assign a new delegate (Intern) to the boss
let johnIntern = Intern()
jonathanBoss.delegate = johnIntern

print("\nAssigning tasks to the Intern:")
jonathanBoss.assignTasks()
