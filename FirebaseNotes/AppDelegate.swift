//
//  AppDelegate.swift
//  FirebaseNotes
//
//  Created by Oleksandr Bretsko on 24.07.2021.
//

import UIKit
import Firebase
import FirebaseAuthUI
import FirebaseGoogleAuthUI
import GoogleSignIn

@main
class AppDelegate: UIResponder, UIApplicationDelegate, FUIAuthDelegate {
    
    lazy var window: UIWindow? = UIWindow()
    private let router = AppCoordinator().strongRouter
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        router.setRoot(for: window!)
        return true
    }
    
    func application(_ app: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        
        
        let sourceApplication = options[UIApplication.OpenURLOptionsKey.sourceApplication] as! String?
        if FUIAuth.defaultAuthUI()?.handleOpen(url, sourceApplication: sourceApplication) ?? false {
            return true
        }
        if GIDSignIn.sharedInstance.handle(url) {
            return true
        }
        return false
    }
}

