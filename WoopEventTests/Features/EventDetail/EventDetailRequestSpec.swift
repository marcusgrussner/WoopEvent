import Foundation
import Alamofire
import Nimble
import Quick
@testable import WoopEvent

class EventDetailRequestSpec: QuickSpec {
 
    override func spec() {
        var sut: CheckingRequest!
        
        describe("Checkin") {
            context("when endpoint is checkin") {
                beforeEach {
                    let info = InfoModel(event: "2", name: "Marcus", email: "teste@teste.com")
                    sut = CheckingRequest(info: info)
                }

                it("uses correct path") {
                    expect(sut.path).to(equal("http://5f5a8f24d44d640016169133.mockapi.io/api/checkin"))
                }

                it("uses correct method") {
                    expect(sut.method).to(equal(HTTPMethod.post))
                }
                
                it("uses correct body") {
                    expect(sut.body).toNot(beNil())
                }
            }
        }
    }
}
