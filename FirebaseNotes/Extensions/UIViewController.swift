//
//  UIViewController.swift
//  FirebaseNotes
//
//  Created by Oleksandr Bretsko on 24.07.2021.
//

import UIKit


extension UIViewController {
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    func showErrorAlert(_ error: Error?) {
        guard let error = error else { return }
        showAlert(title: "Error", message: error.localizedDescription)
    }
}
