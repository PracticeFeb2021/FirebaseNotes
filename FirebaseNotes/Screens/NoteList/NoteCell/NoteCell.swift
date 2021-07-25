//
//  NoteListVC.swift
//  NoteCell
//
//  Created by Oleksandr Bretsko on 1/2/2021.
//

import UIKit

class NoteCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var bodyLabel: UILabel!
    
    static let cellReuseId = "NoteCell"
    
    
    func configure(with note: Note) {
        
        titleLabel?.text = note.title
        bodyLabel?.text = note.body
    }
}

