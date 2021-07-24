//
//  LoginViewController.swift
//  Twittur
//
//  Created by Programador on 21/07/2021.
//

import UIKit
import Firebase

class SignUpVC: UIViewController {
    
    var viewModel: SignUpViewModel!
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        viewModel.signUp(username: LoginVC.testUsername,
                         email: LoginVC.testEmail,
                         password: LoginVC.testPassword)
    }
    
    @IBAction func logInPressed(_ sender: UIButton) {
        viewModel.logInPressed()
    }
}
