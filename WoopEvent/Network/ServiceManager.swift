import Alamofire

// MARK: - ServiceManager Protocol

protocol ServiceManagerProtocol {
    func performRequest<T: Codable>(route: BaseRequestProtocol, completion: @escaping (Result<T, AFError>) -> Void)
}

// MARK: - Class

class ServiceManager: SessionDelegate, ServiceManagerProtocol {
    
    // MARK: - Private variables
    
    private var session: Session?
    
    // MARK: - Initializers
    
    init() {
        super.init()
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldUsePipelining = true
        
        session = Session.init(configuration: configuration,
                               delegate: self,
                               startRequestsImmediately: true)
    }
}

extension ServiceManager {
    
    // MARK: - Public methods
    
    public func performRequest<T: Codable>(route: BaseRequestProtocol,
                                           completion: @escaping (Result<T, AFError>) -> Void) {
        
        let encoding: ParameterEncoding = route.method == .get ? URLEncoding.default : JSONEncoding.default
        
        session?.request(route.path,
                         method: route.method,
                         parameters: route.body,
                         encoding: encoding,
                         headers: route.headers)
            .validate()
            .responseDecodable(completionHandler: { (response: DataResponse<T, AFError>) in
                                
                debugPrint(response)
                
                switch response.result {
                
                case .success(let response):
                    completion(.success(response))
                case .failure(let error):
                    completion(.failure(error))
                }
            })
    }
}
