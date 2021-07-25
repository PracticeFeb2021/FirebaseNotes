//
//  User.swift
//  FirebaseNotes
//
//  Created by Oleksandr Bretsko on 24.07.2021.
//

import Foundation


struct User: Codable {
    let uid: String
    var email: String
    var name: String
}
