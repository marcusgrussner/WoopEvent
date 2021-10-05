import RxCocoa
import RxSwift

// MARK: - Class

final class EventDetailViewModel {
    
    // MARK: - Struct
    
    struct Output {
        let state: Driver<EventDetailViewController.State>
        let data: Driver<EventModel>
    }
    
    // MARK: - Internal variables
    
    let output: Output
    
    // MARK: - Private variables
    
    private let service = CheckinService(service: ServiceManager())
    private let coordinator: EventsCoordinator
    private let event: EventModel
    
    private let state: PublishRelay<EventDetailViewController.State>
    private let data: PublishRelay<EventModel>
    
    // MARK: - Initializers
    
    init(event: EventModel, coordinator: EventsCoordinator) {
        self.event = event
        self.coordinator = coordinator
        
        data = PublishRelay<EventModel>()
        state = PublishRelay<EventDetailViewController.State>()
        
        let loading = state.asDriver(onErrorJustReturn: .error)
        let data = data.asDriver(onErrorJustReturn: event)
        
        output = Output(state: loading, data: data)
    }
}

extension EventDetailViewModel {
    
    // MARK: - Internal methods
    
    func loadData() {
        data.accept(event)
    }
    
    func checkin() {
        
        guard let eventId = event.id else { return }
        
        state.accept(.loading)
        
        let checkin = InfoModel(event: eventId,
                                name: "Marcus",
                                email: "teste@teste.com.br")
        
        service.checkin(info: checkin) { result in
            switch result {
            case .success:
                self.state.accept(.success)
            case .failure:
                self.state.accept(.error)
                //                self.coordinator.error()
            }
        }
    }
}
