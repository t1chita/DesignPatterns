//
//  FirstView.swift
//  MediatorPatternUsingInSwiftUI
//
//  Created by Temur Chitashvili on 12.11.24.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        VStack {
            TaskButton(action: task1) {
                Text("Button 1")
            }
            
            TaskButton(action: task2) {
                Text("Button 2")
            }
            
            TaskButton(action: task3) {
                Text("Button 3")
            }
        }
    }
    
    func task1() async {
        print("Executing Task 1")
        try? await Task.sleep(for: .seconds(2))
        print("Task 1 Completed")
    }
    
    func task2() async {
        print("Executing Task 2")
        try? await Task.sleep(for: .seconds(4))
        print("Task 2 Completed")
    }
    
    func task3() async {
        print("Executing Task 3")
        try? await Task.sleep(for: .seconds(6))
        print("Task 3 Completed")
    }
}
