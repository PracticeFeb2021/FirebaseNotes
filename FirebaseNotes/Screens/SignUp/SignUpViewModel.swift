//
//  SignUpViewModel.swift
//  FirebaseNotes
//
//  Created by Oleksandr Bretsko on 24.07.2021.
//


import UIKit
import XCoordinator
import FirebaseAuth


class SignUpViewModel {
    
    func signUp(username: String,
                email: String,
                password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            if let e = error{
                print("Error: " + e.localizedDescription)
                return
            }
            self?.appRouter.trigger(.home)
        }
    }

    func logInPressed() {
        loginRouter.trigger(.login)
    }

    //MARK: - Private properties
    
    private let loginRouter: UnownedRouter<LoginRoute>
    private let appRouter: UnownedRouter<AppRoute>

    // MARK: - Init
    
    init(loginRouter: UnownedRouter<LoginRoute>,
         appRouter: UnownedRouter<AppRoute>) {
        
        self.loginRouter = loginRouter
        self.appRouter = appRouter
    }
}

