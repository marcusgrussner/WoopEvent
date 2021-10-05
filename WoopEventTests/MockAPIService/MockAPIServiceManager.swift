import Foundation
import Alamofire
@testable import WoopEvent

final class MockAPIServiceManager: ServiceManagerProtocol {
    var data: Any?
    
    init(data: Any?) {
        self.data = data
    }
    
    func performRequest<T>(route: BaseRequestProtocol, completion: @escaping (Result<T, AFError>) -> Void) where T : Decodable, T : Encodable {
        if let data = data {
            completion(.success(data as! T))
        }
    }
}
