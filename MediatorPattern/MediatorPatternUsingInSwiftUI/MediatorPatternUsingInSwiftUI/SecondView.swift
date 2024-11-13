//
//  SecondView.swift
//  MediatorPatternUsingInSwiftUI
//
//  Created by Temur Chitashvili on 12.11.24.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        VStack {
            TaskButton(action: task1) {
                Text("Button 4")
            }
            
            TaskButton(action: task2) {
                Text("Button 5")
            }
            
            TaskButton(action: task3) {
                Text("Button 6")
            }
        }
    }
    
    func task1() async {
        print("Executing Task 4")
        try? await Task.sleep(for: .seconds(2))
        print("Task 4 Completed")
    }
    
    func task2() async {
        print("Executing Task 5")
        try? await Task.sleep(for: .seconds(4))
        print("Task 5 Completed")
    }
    
    func task3() async {
        print("Executing Task 6")
        try? await Task.sleep(for: .seconds(6))
        print("Task 6 Completed")
    }
}
