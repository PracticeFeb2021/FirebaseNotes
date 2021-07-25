//
//  LoginVC.swift
//  SocialApp-MVVMC
//
//  Created by Oleksandr Bretsko on 2/27/21.
//


import UIKit
import SwiftyUserDefaults
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
    weak var handle: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Login"
            
        authUI = FUIAuth.defaultAuthUI()
        authUI.delegate = self
        handle = Auth.auth().addStateDidChangeListener { auth, user in
            if let user = user {
                Defaults[\.userUID] = user.uid
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if authUI.auth?.currentUser != nil {
            viewModel.signInLoggedInUser()
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
            let loginVC = authUI.authViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: true)
        } else {
            viewModel.signInLoggedInUser()
        }
    }
}
