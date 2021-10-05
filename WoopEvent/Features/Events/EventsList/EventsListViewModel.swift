import RxCocoa
import RxSwift

// MARK: - Class

final class EventsListViewModel {
    
    // MARK: - Struct
    
    struct Output {
        let state: Driver<EventsListViewController.State>
        let data: Driver<[EventModel]>
    }
    
    // MARK: - Internal variables
    
    let output: Output
    
    // MARK: - Private variables
    
    private let events: PublishRelay<[EventModel]>
    private let state: PublishRelay<EventsListViewController.State>
    private let service = EventsListService(service: ServiceManager())
    private let coordinator: EventsCoordinator
    
    // MARK: - Initializer
    
    init(coordinator: EventsCoordinator) {
        self.coordinator = coordinator
        events = PublishRelay<[EventModel]>()
        state = PublishRelay<EventsListViewController.State>()
        
        let data = events.asDriver(onErrorJustReturn: [])
        let loading = state.asDriver(onErrorJustReturn: .error)
        
        output = Output(state: loading, data: data)
    }
}

extension EventsListViewModel {
    
    // MARK: - Public methods
    
    func fetch() {
        state.accept(.loading)
        
        service.fetchAll { result in
            switch result {
            case let .success(events):
                self.state.accept(events.count > 0 ? .data : .empty)
                self.events.accept(events)
                
            case .failure:
                self.state.accept(.error)
            }
        }
    }
    
    func detail(item: EventModel) {
        coordinator.detail(item: item)
    }
}
