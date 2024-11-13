//
//  TaskButton.swift
//  MediatorPatternUsingInSwiftUI
//
//  Created by Temur Chitashvili on 13.11.24.
//

import SwiftUI

struct TaskButton<Label: View>: View {
    @Environment(\.taskMediator) private var mediator
    
    private let id = UUID()
    private let action: () async -> Void
    private let label: () -> Label
    
    init(
        action: @escaping () async -> Void,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.action = action
        self.label = label
    }
    
    var body: some View {
        Button {
            Task {
                await mediator.startTask(
                    for: id,
                    action: action
                )
            }
        } label: {
            label()
        }
    }
}
