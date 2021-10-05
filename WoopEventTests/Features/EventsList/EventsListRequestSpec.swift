import Foundation
import Alamofire
import Nimble
import Quick
@testable import WoopEvent

class EventsListRequestSpec: QuickSpec {
 
    override func spec() {
        var sut: EventsListRequest!
        
        describe("EventListService") {
            context("when endpoint is events") {
                beforeEach {
                    sut = EventsListRequest()
                }

                it("uses correct path") {
                    expect(sut.path).to(equal("http://5f5a8f24d44d640016169133.mockapi.io/api/events"))
                }

                it("uses correct method") {
                    expect(sut.method).to(equal(HTTPMethod.get))
                }
                
                it("uses correct body") {
                    expect(sut.body).to(beNil())
                }
            }
        }
    }
}
