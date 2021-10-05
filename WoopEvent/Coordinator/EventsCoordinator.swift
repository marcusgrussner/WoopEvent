import UIKit

// MARK: - Class

final class EventsCoordinator: CoordinatorProtocol {
    
    // MARK: - Internal variables
    
    var children = [CoordinatorProtocol]()
    var navigationController: UINavigationController
    weak var parent: CoordinatorProtocol?
    
    // MARK: - Initializers
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension EventsCoordinator {
    
    // MARK: - Internal methods
    
    func start() {
        let viewModel = EventsListViewModel(coordinator: self)
        let viewController = EventsListViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func detail(item: EventModel) {
        let viewModel = EventDetailViewModel(event: item, coordinator: self)
        let viewController = EventDetailViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}
