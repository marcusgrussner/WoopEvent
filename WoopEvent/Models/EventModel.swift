import Foundation

// MARK: - Event model

struct EventModel: Codable {
    let date: Date?
    let description: String?
    let image: URL?
    let longitude, latitude, price: Double?
    let title, id: String?
}
