import Nimble
import Quick
import RxSwift
import UIKit
import SnapshotTesting
@testable import WoopEvent

final class EventDetailViewSpec: QuickSpec {
    
    override func spec() {
        
        var sut: EventDetailView!
        
        describe("EventDetailView") {
            beforeEach {
                sut  = EventDetailView()
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
            
            context("when event is called") {
                it("has a valid snapshot") {
                    sut.configure(name: "Feira de adoção de animais na Redenção",
                                  date: Date(),
                                  price: 100.0,
                                  desc: "O Patas Dadas estará na Redenção, nesse domingo, com cães para adoção e produtos à venda!\n\nNa ocasião, teremos bottons, bloquinhos e camisetas!\n\nTraga seu Pet, os amigos e o chima, e venha aproveitar esse dia de sol com a gente e com alguns de nossos peludinhos - que estarão prontinhos para ganhar o ♥ de um humano bem legal pra chamar de seu. \n\nAceitaremos todos os tipos de doação:\n- guias e coleiras em bom estado\n- ração (as que mais precisamos no momento são sênior e filhote)\n- roupinhas \n- cobertas \n- remédios dentro do prazo de validade",
                                  thumbnail: URL(string: "http://lproweb.procempa.com.br/pmpa/prefpoa/seda_news/usu_img/Papel%20de%20Parede.png"))
                    
                    assertSnapshot(matching: sut, as: .image(size: .init(width: 375, height: 667)))
                }
            }
        }
    }
}
