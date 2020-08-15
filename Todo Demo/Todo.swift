//
//  Todo.swift
//  Todo Demo
//
//  Created by YJ Soon on 31/7/20.
//  Copyright © 2020 Tinkercademy. All rights reserved.
//

import Foundation

class Todo {
    
    var name: String
    var done = false
    
    init(name: String) {
        self.name = name
    }
    
    init() {
        self.name = ""
    }
    
    static func getArchiveURL() -> URL {
        let plistName = "todos"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent(plistName).appendingPathExtension("plist")
    }
    
    static func saveToFile(todo: [Todo]) {
    let archiveURL = getArchiveURL()
    let propertyListEncoder = PropertyListEncoder()
    let encodedTodos = try? propertyListEncoder.encode(todo)
    try? encodedTodos?.write(to: archiveURL, options: .noFileProtection)
}
}
