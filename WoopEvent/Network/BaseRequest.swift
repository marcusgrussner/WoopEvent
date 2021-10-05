import Alamofire

// MARK: - BaseRequest Protocol

protocol BaseRequestProtocol {
    var method: HTTPMethod { get }
    var path: String { get }
    var body: Parameters? { get }
    var headers: HTTPHeaders? { get }
}
