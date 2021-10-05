import RxCocoa
import RxSwift
import UIKit

// MARK: - Class

final class EventDetailViewController: BaseViewController<EventDetailView> {
    
    // MARK: - Struct
    
    enum State {
        case loading
        case error
        case data
        case success
    }
    
    var state: State = .data {
        willSet {
            switch newValue {
            case .loading:
                customView.showLoading()
            case .error:
                customView.showError()
            case .success:
                customView.disableButton()
            case .data:
                customView.showData()
            }
        }
    }
    
    // MARK: - Private variable
    
    private let viewModel: EventDetailViewModel
    private let disposeBag = DisposeBag()
    
    // MARK: - Initializer
    
    init(viewModel: EventDetailViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitle()
        setupRx()
    }
}

extension EventDetailViewController {
    
    // MARK: - Internal methods
    
    func setupTitle() {
        title = WPStrings.titleEventDetail
    }
    
    func setupRx() {
        viewModel.output.data
            .asObservable()
            .bind(onNext: { [weak self] event in
                self?.customView.configure(name: event.title,
                                           date: event.date.format,
                                           price: event.price.toCurrency,
                                           desc: event.description,
                                           thumbnail: event.image)
            })
            .disposed(by: disposeBag)
        
        viewModel.output.state
            .asObservable()
            .bind(onNext: { [weak self] value in
                self?.state = value
            })
            .disposed(by: disposeBag)
        
        customView.checkin
            .rx
            .tap
            .subscribe(onNext: { [weak self] _ in
                self?.viewModel.checkin()
            })
            .disposed(by: disposeBag)
        
        viewModel.loadData()
    }
}
