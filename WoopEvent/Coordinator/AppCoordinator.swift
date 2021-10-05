import UIKit

// MARK: - Class

final class AppCoordinator: CoordinatorProtocol {
    
    // MARK: - Internal variables
    
    weak var parent: CoordinatorProtocol?
    var children = [CoordinatorProtocol]()
    var navigationController: UINavigationController
    
    // MARK: - Initiliazer
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Internal methods
    
    func start() {
        startEventsCoordinator()
    }
}

extension AppCoordinator {
    
    // MARK: - Private methods
    
    private func startEventsCoordinator() {
        
    }
}
