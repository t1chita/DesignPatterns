//
//  TabView.swift
//  MediatorPatternUsingInSwiftUI
//
//  Created by Temur Chitashvili on 12.11.24.
//

import SwiftUI

struct MyTabView: View {
    var body: some View {
        TabView {
            
            FirstView()
                .tabItem {
                    Label {
                        Text("FirstPage")
                    } icon: {
                        Image(systemName: "house")
                    }
                }

            SecondView()
                .tabItem {
                    Label {
                        Text("SecondPage")
                    } icon: {
                        Image(systemName: "wrench")
                    }
                }
        }
    }
}

#Preview {
    MyTabView()
}
