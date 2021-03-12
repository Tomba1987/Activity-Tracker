//
//  Activity.swift
//  AnotherChallenge
//
//  Created by Tomislav Tomic on 12.01.2021..
//

import Foundation

struct Activity: Codable, Identifiable {
    var id = UUID()
    var name: String
    var duration: String
}
