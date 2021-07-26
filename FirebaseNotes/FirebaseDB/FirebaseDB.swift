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
        let docRef = db.collection(K.DB.notes.rawValue).document(id)
        docRef.getDocument { document, error in
            if let error = error as NSError? {
                print("Error getting document: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }
            guard let document = document,
                  let dict = document.data() else {
                return
            }
            do {
                let decoder = JsonDecoder()
                let decodedNote = try decoder.decode(Note.self, from: dict)
                completion(.success(decodedNote))
            } catch {
                print("Error when trying to decode note: \(error)")
                completion(.failure(error))
            }
        }
    }
    
    func fetchUser(uid: String, completion: @escaping (Result<User, Error>) -> Void) {
        // testing
        completion(.success(Self.testUser))
        return
        
        let docRef = db.collection(K.DB.users.rawValue).document(uid)
        docRef.getDocument { document, error in
            if let error = error as NSError? {
                print("Error getting document: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }
            guard let document = document,
                  let dict = document.data() else {
                return
            }
            do {
                let decoder = JsonDecoder()
                let decodedUser = try decoder.decode(User.self, from: dict)
                completion(.success(decodedUser))
            } catch {
                print("Error when trying to decode user: \(error)")
                completion(.failure(error))
            }
        }
    }
    
    func add(user: User, completion: ((Result<String, Error>) -> Void)?) {
        guard let dict = user.dict else { return }
        let docRef = db.collection(K.DB.users.rawValue).addDocument(data: dict) { error in
            if let error = error {
                print("Adding user failed: \(error.localizedDescription)")
                completion?(.failure(error))
                return
            }
        }
        completion?(.success(docRef.documentID))
    }
    
    func add(note: Note, completion: ((Result<String, Error>) -> Void)?) {
        guard let dict = note.dict else { return }
        let docRef = db.collection(K.DB.notes.rawValue).addDocument(data: dict) { error in
            if let error = error {
                print("Adding note failed: \(error.localizedDescription)")
                completion?(.failure(error))
                return
            }
        }
        completion?(.success(docRef.documentID))
    }
    
    func updateNote(_ note: Note, completion: ((Result<Bool, Error>) -> Void)?) {
        guard let dict = note.dict else { return }
        let docRef = db.collection(K.DB.notes.rawValue).document(note.id)
        docRef.setData(dict)
        completion?(.success(true))
    }
    
    func updateUser(_ user: User, completion: ((Result<Bool, Error>) -> Void)?) {
        guard let dict = user.dict else { return }
        let docRef = db.collection(K.DB.users.rawValue).document(user.uid)
        docRef.setData(dict)
        completion?(.success(true))
    }
    
    func deleteNotes(ids: [String], completion: ((Result<Bool, Error>) -> Void)?) {
        ids.forEach { id in
            deleteNote(id: id)
        }
    }
    
    func deleteNote(id: String, completion: ((Result<Bool, Error>) -> Void)?) {
        db.collection(K.DB.notes.rawValue).document(id).delete() { err in
            if let err = err {
                print("Error deleting note: \(err)")
                completion?(.failure(err))
            } else {
                completion?(.success(true))
            }
        }
    }
    
    func deleteUser(uid: String, completion: ((Result<Bool, Error>) -> Void)?) {
        db.collection(K.DB.users.rawValue).document(uid).delete() { err in
            if let err = err {
                print("Error deleting user: \(err)")
                completion?(.failure(err))
            } else {
                completion?(.success(true))
            }
        }
    }
}
