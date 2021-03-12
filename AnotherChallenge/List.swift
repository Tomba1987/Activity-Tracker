//
//  List.swift
//  AnotherChallenge
//
//  Created by Tomislav Tomic on 12.01.2021..
//

import Foundation

class Lists: ObservableObject {
    @Published var list = [Activity]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(list) {
                UserDefaults.standard.setValue(encoded, forKey: "List")
            }
        }
    }
    
    init() {
        if let list = UserDefaults.standard.data(forKey: "List") {
            let decoder = JSONDecoder()
            
            if let decoded = try? decoder.decode([Activity].self, from: list) {
                self.list = decoded
                return
            }
        }
        
        self.list = []
    }
}
