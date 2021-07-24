//
//  LoggedInP.swift
//  FirebaseNotes
//
//  Created by Oleksandr Bretsko on 24.07.2021.
//

import FirebaseAuthUI

protocol LoggedInP {}
extension LoggedInP {
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch let e as NSError {
            print("Error: " + e.localizedDescription)
        }
    }
}
