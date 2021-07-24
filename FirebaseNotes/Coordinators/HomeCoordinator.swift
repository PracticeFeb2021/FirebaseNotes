
import UIKit
import XCoordinator

enum HomeRoute: Route {
    case notes 
    case logout
    //case settings
}

class HomeCoordinator: NavigationCoordinator<HomeRoute>, LoggedInP {
    
    override func prepareTransition(for route: HomeRoute) -> NavigationTransition {
        switch route {
        case .notes:
            //modal presentation
            let coord = NotesCoordinator(router: unownedRouter)
            return .presentFullScreen(coord)
            
        case .logout:
            logOut()
            return .dismissToRoot()
        }
    }
}
