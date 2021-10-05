import UIKit
import RxSwift
import RxCocoa

// MARK: - Class

final class EventsListViewController: BaseViewController<EventsListView>, UIScrollViewDelegate {
    
    enum State {
        case loading
        case error
        case data
        case empty
    }
    
    var state: State = .loading {
        willSet {
            switch newValue {
            case .loading:
                customView.showLoading()
            case .error:
                customView.showError()
            case .data:
                customView.showTableView()
            case .empty:
                customView.showEmptyList()
            }
        }
    }
    
    // MARK: - Private variables
    
    private let viewModel: EventsListViewModel
    private let disposeBag = DisposeBag()
    
    // MARK: - Initializer
    
    init(viewModel: EventsListViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    // MARK: - Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitle()
        setupRx()
    }
}

extension EventsListViewController {
    
    // MARK: - Private methods
    
    func setupTitle() {
        title = WPStrings.titleListEvents
    }
    
    private func setupRx() {
        viewModel.output.state
            .asObservable()
            .bind(onNext: { [weak self] value in
                self?.state = value
            })
            .disposed(by: disposeBag)
        
        viewModel.output.data
            .asObservable()
            .bind(to: customView.tableView
                    .rx
                    .items(cellIdentifier: EventsCell.identifier,
                           cellType: EventsCell.self)) { _, element, cell in
                
                cell.configure(imageURL: element.image,
                               title: element.title,
                               date: element.date,
                               price: element.price)
            }
            .disposed(by: disposeBag)
        
        customView.tableView
            .rx
            .setDelegate(self)
            .disposed(by: disposeBag)
        
        customView.tableView
            .rx
            .modelSelected(EventModel.self)
            .asDriver()
            .drive(onNext: { [weak self] item in
                self?.viewModel.detail(item: item)
            })
            .disposed(by: disposeBag)
        
        customView.retry
            .rx
            .tap
            .subscribe(onNext: { [weak self] _ in
                self?.viewModel.fetch()
            })
            .disposed(by: disposeBag)
        
        viewModel.fetch()
    }
}
