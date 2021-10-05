import UIKit
import Alamofire

// MARK: - Class

final class CheckinService {
    
    // MARK: - Private variables
    
    private let service: ServiceManagerProtocol
    
    // MARK: - Initializers
    
    init(service: ServiceManagerProtocol) {
        self.service = service
    }
}

extension CheckinService {
    
    // MARK: - Public methods
    
    func checkin(info: InfoModel, completion: @escaping (Result<CheckinResponse, AFError>) -> Void) {
        let request = CheckingRequest(info: info)
        service.performRequest(route: request, completion: completion)
    }
}

// MARK: - Checkin Request

struct CheckingRequest: BaseRequestProtocol {
    var path: String
    var method: HTTPMethod
    var body: Parameters?
    var headers: HTTPHeaders?
    
    init(info: InfoModel) {
        path = .baseURL + "/checkin"
        method = .post
        body = [
            "eventId": info.event,
            "name": info.name,
            "email": info.email
        ]
    }
}
