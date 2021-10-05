import Foundation
import Alamofire
import Nimble
import Quick
@testable import WoopEvent

final class EventsListServiceSpec: QuickSpec {
    
    override func spec() {
        var sut: EventsListService!
        
        var eventsMock: [EventModel]!
        
        describe("EventsListService") {
            
            beforeEach {
                let jsonDecoder = JSONDecoder()
                if let json = self.loadJson(from: "eventsList"),
                   let data = try? jsonDecoder.decode([EventModel].self, from: json) {
                    eventsMock = data
                } else {
                    fail("Decoding error")
                }
                
                let service = MockAPIServiceManager(data: eventsMock)
                sut = EventsListService(service: service)
            }
            
            context("Event list success") {
                it("Should return an events list") {
                    waitUntil { done in
                        sut.fetchAll { result in
                            switch result {
                            case .success:
                                done()
                            case let .failure(error):
                                fail(error.localizedDescription)
                            }
                        }
                    }
                }
            }
        }
    }
}
