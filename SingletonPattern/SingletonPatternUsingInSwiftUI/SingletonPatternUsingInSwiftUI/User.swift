//
//  User.swift
//  SingletonPatternUsingInSwiftUI
//
//  Created by Temur Chitashvili on 19.11.24.
//


import Foundation

struct User {
    let id = UUID().uuidString
    let name: String
    var favourites: [Music]
    var lastMusic: Music
}

struct Music {
    let id = UUID().uuidString
    let name: String
    let duration: Int
    let author: String
}
