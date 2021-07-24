//
//  NoteListViewModel.swift
//  SocialApp
//
//  Created by Oleksandr Bretsko on 1/2/2021.
//

import UIKit
import XCoordinator


class NoteListViewModel {
    
    //MARK: - Inputs

    func logoutButtonPressed() {
        router.trigger(.logout)
    }
    
    //MARK: - Private properties
    
    private let router: UnownedRouter<NotesRoute>
    
    // MARK: - Init
    
    init(router: UnownedRouter<NotesRoute>) {
        self.router = router
    }
}

