//
//  LoginVC.swift
//  SocialApp-MVVMC
//
//  Created by Oleksandr Bretsko on 2/27/21.
//


import UIKit
import FirebaseGoogleAuthUI
import FirebaseCore
import FirebaseEmailAuthUI
import GoogleSignIn


class LoginVC: UIViewController, FUIAuthDelegate {
    
    var viewModel: LoginViewModel!
    
    static let testUsername = "Sasha"
    static let testEmail = "sasha@test.com"
    static let testPassword = "password"
    
    var authUI: FUIAuth!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Login"
            
        authUI = FUIAuth.defaultAuthUI()
        authUI.delegate = self
        
        // check if logged in
        if authUI.auth?.currentUser != nil {
            viewModel.signInLoggedInUser()
            return
        }
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        viewModel.signUpButtonTapped()
    }
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        signIn()
    }
    
    func signIn() {
        let providers: [FUIAuthProvider] = [
            FUIEmailAuth(),
            FUIGoogleAuth(authUI: authUI),
        ]
        if authUI.auth?.currentUser == nil {
            self.authUI.providers = providers
            let loginViewController = authUI.authViewController()
            loginViewController.modalPresentationStyle = .fullScreen
            present(loginViewController, animated: true, completion: nil)
        } else {
            viewModel.signInLoggedInUser()
        }
    }
}
