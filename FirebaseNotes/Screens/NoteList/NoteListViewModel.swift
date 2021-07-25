//
//  NoteListViewModel.swift
//  SocialApp
//
//  Created by Oleksandr Bretsko on 1/2/2021.
//

import UIKit
import XCoordinator


class NoteListViewModel {
    
    //MARK: - Outputs
    
    var notes = Box<[Note]>([])
    
    //MARK: - Inputs
    
    func ready() {
        firebaseDB.fetchNotes { [weak self] result in
            switch result {
            case .failure(let error):
                //TODO: handle error
                print("ERROR: \(error)")
                
            case .success(let notes):
                DispatchQueue.main.async { [weak self] in
                    self?.notes.value = notes
                }
            }
        }
    }
    
    func didSelectNote(at index: Int) {
        let note = notes.value[index]
        router.trigger(.note(note))
    }
    
    func logoutButtonPressed() {
        router.trigger(.logout)
    }
    
    //MARK: - Private properties
    
    private let firebaseDB: FirebaseDB
    private let router: UnownedRouter<NotesRoute>
    
    // MARK: - Init
    
    init(router: UnownedRouter<NotesRoute>,
         firebaseDB: FirebaseDB) {
        self.router = router
        self.firebaseDB = firebaseDB
    }
}

