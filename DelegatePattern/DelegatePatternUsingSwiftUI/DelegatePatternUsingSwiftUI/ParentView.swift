//
//  ContentView.swift
//  DelegatePatternUsingSwiftUI
//
//  Created by Temur Chitashvili on 20.11.24.
//

import SwiftUI

// MARK: - Protocol Definition
/// Defines a protocol for delegating user actions
protocol ChildViewDelegate {
    /// Method to handle a button press from the child view
    func didTapButton(message: String)
}

// MARK: - Parent View
/// The parent view that contains the child view and implements the delegate
struct ParentView: View {
    @State private var log: String = "Waiting for action..." // State to display messages from the delegate
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Delegate Pattern in SwiftUI")
                .font(.headline)
            
            // Display the log message
            Text(log)
                .foregroundColor(.blue)
            
            // Add the child view and set the delegate
            ChildView(delegate: self)
            
            Spacer()
        }
        .padding()
    }
}

// Extend `ParentView` to conform to `ChildViewDelegate`
extension ParentView: ChildViewDelegate {
    func didTapButton(message: String) {
        // Handle the button action and update the UI
        log = message
    }
}
