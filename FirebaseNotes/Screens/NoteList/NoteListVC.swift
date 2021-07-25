//
//  NoteListVC.swift
//  SocialApp
//
//  Created by Oleksandr Bretsko on 1/2/2021.
//

import UIKit


class NoteListVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: NoteListViewModel!
    
    //MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        navigationItem.title = "Notes"
        
        tableView.register(UINib(nibName: "NoteCell", bundle: nil), forCellReuseIdentifier: NoteCell.cellReuseId)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let logoutButton = UIBarButtonItem(title: "Log out", style: .plain, target: self, action: #selector(logoutButtonPressed))
        navigationItem.rightBarButtonItem = logoutButton
        
        bindViewModel()
        viewModel.ready()
    }
    
    //MARK: - private
    
    private func bindViewModel() {
        viewModel.notes.bind {  [weak self] _ in
            self?.tableView.reloadData()
        }
    }
    
    @objc private func logoutButtonPressed(){
        viewModel.logoutButtonPressed()
    }
}

//MARK: - TableView

extension NoteListVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return viewModel.notes.value.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard !viewModel.notes.value.isEmpty else {
            return UITableViewCell()
        }
        let cell =
            tableView.dequeueReusableCell(withIdentifier: NoteCell.cellReuseId, for: indexPath) as! NoteCell
        cell.configure(with: viewModel.notes.value[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectNote(at: indexPath.row)
    }
}
