//
//  NoteViewModel.swift
//  SocialApp
//
//  Created by Oleksandr Bretsko on 1/2/2021.
//

import UIKit
import XCoordinator


class NoteViewModel {
    
    //MARK: - Outputs
    
    var note: Box<Note>
    
    //MARK: - Inputs
    
    func backButtonTapped() {
        router.trigger(.noteList)
    }
    func logoutButtonPressed() {
        router.trigger(.logout)
    }
    func saveButtonPressed() {
        firebaseDB.updateNote(note.value)
    }
    
    //MARK: - Private properties
    
    private let firebaseDB: FirebaseDB
    private let router: UnownedRouter<NotesRoute>
    
    // MARK: - Init
    
    init(_ note: Note,
         _ router: UnownedRouter<NotesRoute>,
         _ firebaseDB: FirebaseDB) {
        self.note = Box(note)
        self.router = router
        self.firebaseDB = firebaseDB
    }
}

