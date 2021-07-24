//
//  NoteListVC.swift
//  SocialApp
//
//  Created by Oleksandr Bretsko on 1/2/2021.
//

import UIKit


class NoteListVC: UIViewController {
    
    var viewModel: NoteListViewModel!
    
    //MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        let logoutButton = UIBarButtonItem(title: "Log out", style: .plain, target: self, action: #selector(logoutButtonPressed))
        navigationItem.rightBarButtonItem = logoutButton
    }
    
    //MARK: - private
    
    @objc private func logoutButtonPressed(){
        viewModel.logoutButtonPressed()
    }
}
