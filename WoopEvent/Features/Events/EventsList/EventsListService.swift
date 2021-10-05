import UIKit
import Alamofire

// MARK: - Class

final class EventsListService {
    
    // MARK: - Private variables
    
    private let service: ServiceManagerProtocol
    
    // MARK: - Initializers
    
    init(service: ServiceManagerProtocol) {
        self.service = service
    }
}

extension EventsListService {
    
    // MARK: - Public methods
    
    func fetchAll(completion: @escaping (Result<[EventModel], AFError>) -> Void) {
        let request = EventsListRequest()
        service.performRequest(route: request, completion: completion)
    }
}

// MARK: - EventList Request

struct EventsListRequest: BaseRequestProtocol {
    var path: String
    var method: HTTPMethod
    var body: Parameters?
    var headers: HTTPHeaders?
    
    init() {
        path = .baseURL + "/events"
        method = .get
    }
}
