
import UIKit
import XCoordinator
import FirebaseAuth

enum NotesRoute: Route {
    case noteList
    case logout
    case note(Note)
}

class NotesCoordinator: NavigationCoordinator<NotesRoute> {
    
    var homeRouter: UnownedRouter<HomeRoute>
    
    init(router: UnownedRouter<HomeRoute>) {
        self.homeRouter = router
        super.init(initialRoute: .noteList)
    }
    
    override func prepareTransition(for route: NotesRoute) -> NavigationTransition {
        
        switch route {
        case .noteList:
            let vc = NoteListVC.instantiateFromNib()
            let viewModel = NoteListViewModel(router: unownedRouter, firebaseDB: FirebaseDB.shared)
            vc.viewModel = viewModel
            return .push(vc)
        case .logout:
            homeRouter.trigger(.logout)
            return .none()
        case .note(let note):
            let vc = NoteVC.instantiateFromNib()
            let viewModel = NoteViewModel(note, unownedRouter, FirebaseDB.shared)
            vc.viewModel = viewModel
            return .push(vc)
        }
    }
}
