//
//  FirebaseDB.swift
//  FirebaseNotes
//
//  Created by Oleksandr Bretsko on 25.07.2021.
//

import Foundation
import FirebaseFirestore


class FirebaseDB: FirebaseDatabaseP {
    static let shared = FirebaseDB()
    
    let db = Firestore.firestore()

    func fetchNotes(completion: @escaping (Result<[Note], Error>) -> Void) {
        completion(.success(Self.testNotes))
    }
    
    func fetchNote(id: String, completion: @escaping (Result<Note, Error>) -> Void) {
    
    }
    
    func fetchUser(uid: String, completion: @escaping (Result<User, Error>) -> Void) {
        completion(.success(Self.testUser))
    }
    
    func save(user: User, completion: ((Result<Bool, Error>) -> Void)?) {
    
    }
    
    func save(note: Note, completion: ((Result<Bool, Error>) -> Void)?) {
    
    }
    
    func deleteNotes(ids: [String], completion: ((Result<Bool, Error>) -> Void)?) {
        
    }
    
    func deleteNote(id: String, completion: ((Result<Bool, Error>) -> Void)?) {
        
    }
    
    func deleteUser(uid: String, completion: ((Result<Bool, Error>) -> Void)?) {
        
    }
}
