//
//  Constants.swift
//  FirebaseNotes
//
//  Created by Oleksandr Bretsko on 24.07.2021.
//

import Foundation

/// Constants
struct K {
    enum DB: String {
        case users = "Users"
        case notes = "Notes"
        
        enum Users: String {
            case uid
            case email
            case name
        }
        
        enum Notes: String {
            case id
            case title
            case body
        }
    }
}
