import Foundation

// MARK: - Info model

struct InfoModel: Codable {
    let event: String
    let name: String
    let email: String
}

// MARK: - Checkin Response

struct CheckinResponse: Codable {
    var code: String
}
