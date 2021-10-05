import Nimble
import Quick
import RxSwift
import UIKit
@testable import WoopEvent

final class EventsListViewModelSpec: QuickSpec {
    
    override func spec() {
        
        var sut: EventsListViewModel!
        var coordinator: EventsCoordinator!
        var eventsMock: [EventModel]!
        
        describe("EventListViewModel") {
            beforeEach {
                coordinator = EventsCoordinator(navigationController: UINavigationController())
                let jsonDecoder = JSONDecoder()
                if let json = self.loadJson(from: "eventsList"),
                   let data = try? jsonDecoder.decode([EventModel].self, from: json) {
                    eventsMock = data
                } else {
                    fail("Decoding error")
                }
                sut = EventsListViewModel(coordinator: coordinator)
                sut.fetch()
            }
            
            context("when has fetch events done") {
                it("Should not be nil") {
                    expect(sut.output.data).toNot(beNil())
                }
            }
            
            context("when has selected an event") {
                it("If the first event is selected") {
                    expect(sut.detail(item: eventsMock[0])).toNot(beNil())
                }
            }
        }
    }
}
