import Nimble
import Quick
import RxSwift
import UIKit
@testable import WoopEvent

final class EventDetailViewControllerSpec: QuickSpec {
    
    override func spec() {
        
        var sut: EventDetailViewController!
        var viewModel: EventDetailViewModel!
        var coordinator: EventsCoordinator!
        var eventMock: EventModel!
        
        describe("EventDetailViewController") {
            beforeEach {
                coordinator = EventsCoordinator(navigationController: UINavigationController())
                let jsonDecoder = JSONDecoder()
                if let json = self.loadJson(from: "event"),
                   let data = try? jsonDecoder.decode(EventModel.self, from: json) {
                    eventMock = data
                } else {
                    fail("Decoding error")
                }
                viewModel = EventDetailViewModel(event: eventMock, coordinator: coordinator)
                sut = EventDetailViewController(viewModel: viewModel)
            }
            
            context("when view controller is loaded") {
                it("has a valid title") {
                    sut.setupTitle()
                    expect(sut.title).toNot(beNil())
                }
            }
            
            context("when state changed") {
                it("to loading") {
                    sut.state = .loading
                    expect(sut.customView.overlay.isHidden).to(beFalse())
                }
                
                it("to error") {
                    sut.state = .error
                    expect(sut.customView.overlay.isHidden).to(beTrue())
                }
                
                it("to data") {
                    sut.state = .data
                    expect(sut.customView.overlay.isHidden).to(beTrue())
                }
            }
        }
    }
}
