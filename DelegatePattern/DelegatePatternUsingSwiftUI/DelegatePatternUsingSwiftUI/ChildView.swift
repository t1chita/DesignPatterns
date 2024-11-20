//
//  ChildView.swift
//  DelegatePatternUsingSwiftUI
//
//  Created by Temur Chitashvili on 20.11.24.
//


import SwiftUI

// MARK: - Child View
/// The child view that interacts with the parent view via the delegate
struct ChildView: View {
    var delegate: ChildViewDelegate?
    
    var body: some View {
        VStack {
            Text("Child View")
                .font(.subheadline)
            
            // Button that triggers the delegate method
            Button(action: {
                delegate?.didTapButton(message: "Child View Button Pressed!")
            }) {
                Text("Press Me")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
    }
}