//
//  FirebaseDatabaseP.swift
//  FirebaseNotes
//
//  Created by Oleksandr Bretsko on 25.07.2021.
//

import Foundation


protocol FirebaseDatabaseP {
    
    func fetchNotes(completion: @escaping (Result<[Note], Error>) -> Void)
    
    func fetchNote(id: String,
                   completion: @escaping (Result<Note, Error>) -> Void)
    
    func fetchUser(uid: String,
                   completion: @escaping (Result<User, Error>) -> Void)
    
    func add(user: User,
             completion: ((Result<String, Error>) -> Void)?)
    
    func add(note: Note,
             completion: ((Result<String, Error>) -> Void)?)
    
    func updateNote(_ note: Note, completion: ((Result<Bool, Error>) -> Void)?)
    
    func updateUser(_ user: User, completion: ((Result<Bool, Error>) -> Void)?)
    
    func deleteNotes(ids: [String],
                     completion: ((Result<Bool, Error>) -> Void)?)
    
    func deleteNote(id: String,
                    completion: ((Result<Bool, Error>) -> Void)?)
    
    func deleteUser(uid: String,
                    completion: ((Result<Bool, Error>) -> Void)?)
    
    //TODO: search text in notes
}

extension FirebaseDatabaseP {
    
    func add(user: User) {
        add(user: user, completion: nil)
    }
    func add(note: Note) {
        add(note: note, completion: nil)
    }
    
    func updateNote(_ note: Note) {
        updateNote(note, completion: nil)
    }
    func updateUser(_ user: User) {
        updateUser(user, completion: nil)
    }
    
    func deleteNotes(ids: [String]) {
        deleteNotes(ids: ids, completion: nil)
    }
    func deleteNote(id: String) {
        deleteNote(id: id, completion: nil)
    }
    func deleteUser(uid: String) {
        deleteUser(uid: uid, completion: nil)
    }
}
