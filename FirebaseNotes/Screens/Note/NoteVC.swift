//
//  NoteVC.swift
//  SocialApp
//
//  Created by Oleksandr Bretsko on 1/2/2021.
//

import UIKit


class NoteVC: UIViewController {

    @IBOutlet weak var noteTitleTextField: UITextField!
    @IBOutlet weak var noteTextView: UITextView!
    
    var viewModel: NoteViewModel!

    //MARK: - View lifecycle
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        setNote(viewModel.note.value)
        
        let saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveButtonPressed))
        navigationItem.rightBarButtonItem = saveButton
        bindViewModel()
    }

    //MARK: - Setup

    private func bindViewModel() {
        viewModel.note.bind { [weak self] note in
            self?.setNote(note)
        }
    }
    
    @objc private func saveButtonPressed() {
        guard let noteTitle = noteTitleTextField.text else {
            print("Error: cannot save note with empty title")
            return
        }
        viewModel.note.value.title = noteTitle
        viewModel.note.value.body = noteTextView.text
        viewModel.saveButtonPressed()
    }
    
    //MARK: - Private
    
    private func setNote(_ note: Note) {
        noteTitleTextField.text = note.title
        noteTextView.text = note.body
    }
    
    @objc private func logoutButtonPressed(){
        viewModel.logoutButtonPressed()
    }
}

