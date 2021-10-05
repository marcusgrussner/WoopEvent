import Nimble
import Quick
import RxSwift
import UIKit
@testable import WoopEvent

final class EventsListViewControllerSpec: QuickSpec {
    
    override func spec() {
        
        var sut: EventsListViewController!
        var viewModel: EventsListViewModel!
        var coordinator: EventsCoordinator!

        describe("EventListViewController") {
            beforeEach {
                coordinator = EventsCoordinator(navigationController: UINavigationController())
                viewModel = EventsListViewModel(coordinator: coordinator)
                sut = EventsListViewController(viewModel: viewModel)
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
                    expect(sut.customView.tableView.isHidden).to(beTrue())
                    expect(sut.customView.overlay.isHidden).to(beFalse())
                }
                
                it("to error") {
                    sut.state = .error
                    expect(sut.customView.tableView.isHidden).to(beTrue())
                    expect(sut.customView.overlay.isHidden).to(beTrue())
                }
                
                it("to data") {
                    sut.state = .data
                    expect(sut.customView.tableView.isHidden).to(beFalse())
                    expect(sut.customView.overlay.isHidden).to(beTrue())
                }
            }
        }
    }
}
