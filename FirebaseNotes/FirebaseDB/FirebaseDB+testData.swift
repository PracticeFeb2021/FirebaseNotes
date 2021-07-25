//
//  FirebaseDB+testData.swift
//  FirebaseNotes
//
//  Created by Oleksandr Bretsko on 25.07.2021.
//

import Foundation

extension FirebaseDB {
    
    static let testNotes: [Note] = {
        var notes = [Note]()
        for i in 1...10 {
            let note = Note(id: UUID().uuidString, title: Lorem.title, body: Lorem.paragraphs(3), dateModified: Date())
            notes.append(note)
        }
        return notes
    }()
    
    static let testUser: User = {
        User(uid: UUID().uuidString, email: LoginVC.testEmail, name: LoginVC.testUsername)
    }()
}
