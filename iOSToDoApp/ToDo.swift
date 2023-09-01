//
//  ToDo.swift
//  iOSToDoApp
//
//  Created by mivanovskaya on 01.09.2023.
//

import Foundation

struct ToDo: Equatable {
    let id = UUID()
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?

    static func ==(lhs: ToDo, rhs: ToDo) -> Bool {
        return lhs.id == rhs.id
    }
    
    static func loadToDos() -> [ToDo]? {
        return nil
    }
    
    static func loadSampleToDos() -> [ToDo] {
        return
            [ToDo(title: "To buy a new mobile phone", isComplete: false, dueDate: Date(), notes: "should be a red one"),
             ToDo(title: "Uncle Bob's Birthday", isComplete: false, dueDate: Date(), notes: "congratulate uncle Bob on his 53rd birthday"),
             ToDo(title: "ToDo 3", isComplete: false, dueDate: Date(), notes: "something to do")]
    }
}
