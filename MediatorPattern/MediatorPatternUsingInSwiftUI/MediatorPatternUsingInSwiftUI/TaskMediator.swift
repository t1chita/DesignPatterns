//
//  TaskMediator.swift
//  MediatorPatternUsingInSwiftUI
//
//  Created by Temur Chitashvili on 13.11.24.
//

import SwiftUI

@Observable
final class TaskMediator {
    private(set) var activeButtonID: UUID? = nil
    
    func startTask(
        for buttonID: UUID,
        action: @escaping () async -> Void
    ) async {
        guard activeButtonID == nil else {
            print("Task is already running. Ignoring this request")
            return
        }
        
        activeButtonID = buttonID
        print("Starting task for button \(buttonID)")
        
        await action()
        
        print("Task completed for button \(buttonID)")
        activeButtonID = nil
    }
}

extension EnvironmentValues {
    @Entry var taskMediator = TaskMediator()
}
