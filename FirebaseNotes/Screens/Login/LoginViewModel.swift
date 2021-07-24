//
//  HomeViewModel.swift
//  SocialApp-MVVMC
//
//  Created by Oleksandr Bretsko on 2/27/21.
//


import UIKit
import XCoordinator
import FirebaseFirestore
import FirebaseAuth
import Firebase


class LoginViewModel: LoggedInP {
    
    //MARK: - Private properties
    
    private let loginRouter: UnownedRouter<LoginRoute>
    private let appRouter: UnownedRouter<AppRoute>
    
    
    // MARK: - Init
    
    init(loginRouter: UnownedRouter<LoginRoute>,
         appRouter: UnownedRouter<AppRoute>) {
        self.loginRouter = loginRouter
        self.appRouter = appRouter
    }
    
    func signUpButtonTapped() {
        loginRouter.trigger(.signUp)
    }
    
    func signInLoggedInUser() {
        appRouter.trigger(.home)
    }
    
    func logIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let e = error {
                print("Error: " + e.localizedDescription)
                return
            }
            self.appRouter.trigger(.home)
        }
    }
}

