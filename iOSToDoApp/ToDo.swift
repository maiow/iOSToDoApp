//
//  ToDo.swift
//  iOSToDoApp
//
//  Created by mivanovskaya on 01.09.2023.
//

import Foundation

struct ToDo: Equatable, Codable {
    let id: UUID
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    init(title: String, isComplete: Bool, dueDate: Date, notes: String?) {
        self.id = UUID()
        self.title = title
        self.isComplete = isComplete
        self.dueDate = dueDate
        self.notes = notes
    }
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory,
       in: .userDomainMask).first!
    static let archiveURL =
       documentsDirectory.appendingPathComponent("toDos")
       .appendingPathExtension("plist")
    

    static func ==(lhs: ToDo, rhs: ToDo) -> Bool {
        return lhs.id == rhs.id
    }
    
    static func loadToDos() -> [ToDo]? {
        guard let codedToDos = try? Data(contentsOf: archiveURL) else {return nil}
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<ToDo>.self, from: codedToDos)
    }
    
    static func saveToDos(_ toDos: [ToDo]) {
        let propertyListEncoder = PropertyListEncoder()
        let codedToDos = try? propertyListEncoder.encode(toDos)
        try? codedToDos?.write(to: archiveURL, options: .noFileProtection)
    }
    
    static func loadSampleToDos() -> [ToDo] {
        return
            [ToDo(title: "To buy a new mobile phone", isComplete: false, dueDate: Date(), notes: "should be a red one"),
             ToDo(title: "Uncle Bob's Birthday", isComplete: false, dueDate: Date(), notes: "congratulate uncle Bob on his 53rd birthday"),
             ToDo(title: "ToDo 3", isComplete: false, dueDate: Date(), notes: "something to do")]
    }
}
