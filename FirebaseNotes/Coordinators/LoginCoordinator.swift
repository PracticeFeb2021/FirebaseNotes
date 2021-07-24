
import UIKit
import XCoordinator
import FirebaseAuth

enum LoginRoute: Route {
    case login
    case signUp
    //case forgotPassword
}

class LoginCoordinator: NavigationCoordinator<LoginRoute> {
    
    var appRouter: UnownedRouter<AppRoute>
    
    init(rootViewController: UINavigationController,
         initialRoute: LoginRoute = .login,
         appRouter: UnownedRouter<AppRoute>) {
        self.appRouter = appRouter
        super.init(rootViewController: rootViewController, initialRoute: initialRoute)
    }
    
    override func prepareTransition(for route: LoginRoute) -> NavigationTransition {
        switch route {
        case .login:
            let vc = LoginVC.instantiateFromNib()
            let viewModel = LoginViewModel(loginRouter: unownedRouter, appRouter: appRouter)
            vc.viewModel = viewModel
            return .push(vc)
            
        case .signUp:
            let vc = SignUpVC.instantiateFromNib()
            let viewModel = SignUpViewModel(loginRouter: unownedRouter, appRouter: appRouter)
            vc.viewModel = viewModel
            return .push(vc)
        }
    }
}
