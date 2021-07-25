//
//  FirebaseDatabaseP.swift
//  FirebaseNotes
//
//  Created by Oleksandr Bretsko on 25.07.2021.
//

import Foundation


protocol FirebaseDatabaseP {
    
    func fetchNotes(completion: @escaping (Result<[Note], Error>) -> Void)
    
    func fetchNote(id: String, completion: @escaping (Result<Note, Error>) -> Void)
    
    func fetchUser(uid: String, completion: @escaping (Result<User, Error>) -> Void)
    
    func save(user: User, completion: ((Result<Bool, Error>) -> Void)?)
    
    func save(note: Note, completion: ((Result<Bool, Error>) -> Void)?)
    
    func deleteNotes(ids: [String], completion: ((Result<Bool, Error>) -> Void)?)
    
    func deleteNote(id: String, completion: ((Result<Bool, Error>) -> Void)?)
    
    func deleteUser(uid: String, completion: ((Result<Bool, Error>) -> Void)?)
    
    //TODO: search text in notes
}

extension FirebaseDatabaseP {
    
    func save(user: User) {
        save(user: user, completion: nil)
    }
    func save(note: Note) {
        save(note: note, completion: nil)
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
