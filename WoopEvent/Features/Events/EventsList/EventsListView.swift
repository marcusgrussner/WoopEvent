import UIKit

// MARK: - Class

final class EventsListView: UIView {
    
    // MARK: - Internal variables
    
    lazy var tableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(EventsCell.self, forCellReuseIdentifier: EventsCell.identifier)
        $0.tableFooterView = nil
        $0.tableHeaderView = nil
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = 72.0
        $0.separatorStyle = .none
        $0.backgroundColor = .white
        return $0
    }(UITableView())
    
    lazy var overlay: OverlayView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isHidden = true
        return $0
    }(OverlayView(style: .solid))
    
    lazy var retry: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 19)
        $0.titleLabel?.textColor = .white
        $0.titleLabel?.textAlignment = .center
        $0.backgroundColor = UIColor(red: 1.00, green: 0.18, blue: 0.33, alpha: 1.0)
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        $0.setTitle(WPStrings.tryAgain, for: .normal)
        return $0
    }(UIButton())
    
    // MARK: - Private variables
    
    private lazy var message: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 21)
        $0.textColor = .red
        $0.textAlignment = .center
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    private lazy var stackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = 18
        $0.isHidden = true
        return $0
    }(UIStackView())
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EventsListView {
    
    // MARK: - Internal methods
    
    func showLoading() {
        tableView.isHidden = true
        stackView.isHidden = true
        overlay.isHidden = false
    }
    
    func showError() {
        tableView.backgroundView = nil
        message.text = WPStrings.eventListErrorLoad
        insertSubview(stackView, belowSubview: overlay)
        tableView.isHidden = true
        stackView.isHidden = false
        overlay.isHidden = true
        addConstraints()
    }
    
    func showTableView() {
        tableView.isHidden = false
        message.text = WPStrings.eventListEmptyMessage
        stackView.isHidden = true
        overlay.isHidden = true
    }
    
    func showEmptyList() {
        tableView.isHidden = true
        message.text = WPStrings.eventListEmptyMessage
        stackView.isHidden = false
        overlay.isHidden = true
    }
    
    // MARK: - Private methods
    
    private func setup() {
        backgroundColor = .white
        addComponents()
        addConstraints()
        showTableView()
    }
    
    private func addComponents() {
        addSubview(tableView)
        stackView.addArrangedSubview(message)
        stackView.addArrangedSubview(retry)
        addSubview(stackView)
        addSubview(overlay)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            overlay.leftAnchor.constraint(equalTo: leftAnchor),
            overlay.rightAnchor.constraint(equalTo: rightAnchor),
            overlay.topAnchor.constraint(equalTo: topAnchor),
            overlay.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
