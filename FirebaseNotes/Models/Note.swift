//
//  Note.swift
//  FirebaseNotes
//
//  Created by Oleksandr Bretsko on 24.07.2021.
//

import Foundation


struct Note: Codable {
    let id: String
    var title: String
    var body: String
    var dateModified: Date
}
