import Nimble
import Quick
import RxSwift
import UIKit
@testable import WoopEvent

final class EventDetailViewModelSpec: QuickSpec {
    
    override func spec() {
        
        var sut: EventDetailViewModel!
        var eventMock: EventModel!
        var coordinator: EventsCoordinator!

        describe("EventDetailViewModel") {
            beforeEach {
                coordinator = EventsCoordinator(navigationController: UINavigationController())
                let jsonDecoder = JSONDecoder()
                if let json = self.loadJson(from: "event"),
                   let data = try? jsonDecoder.decode(EventModel.self, from: json) {
                    eventMock = data
                } else {
                    fail("Decoding error")
                }
                sut = EventDetailViewModel(event: eventMock, coordinator: coordinator)
                sut.checkin()
            }
            
            context("when has load done") {
                it("Should not be nil") {
                    expect(sut.output.data).toNot(beNil())
                }
            }
        }
    }
}
