import Nimble
import Quick
import RxSwift
import UIKit
import SnapshotTesting
@testable import WoopEvent

final class EventsListViewSpec: QuickSpec {
    
    override func spec() {
        
        var sut: EventsListView!
        
        describe("TweetsView") {
            beforeEach {
                sut  = EventsListView()
            }
            
            context("when view is initialized") {
                it("has a valid snapshot") {
                    assertSnapshot(matching: sut, as: .image(size: .init(width: 375, height: 667)))
                }
            }
            
            context("when showError is called") {
                it("has a valid snapshot") {
                    sut.showError()
                    assertSnapshot(matching: sut, as: .image(size: .init(width: 375, height: 667)))
                }
            }
            
            context("when showLoading is called") {
                it("has a valid snapshot") {
                    sut.showLoading()
                    assertSnapshot(matching: sut, as: .image(size: .init(width: 375, height: 667)))
                }
            }
            
            context("when tableview is called") {
                it("has a valid snapshot") {
                    sut.showTableView()
                    assertSnapshot(matching: sut, as: .image(size: .init(width: 375, height: 667)))
                }
            }
        }
    }
}
