import UIKit

// MARK: - Class

final class EventDetailView: UIView {
    
    // MARK: - Internal variables
    
    let scrollView: UIScrollView = {
        $0.showsHorizontalScrollIndicator = false
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIScrollView())
    
    let name: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    let date: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 14)
        return $0
    }(UILabel())
    
    let desc: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 13)
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    let price: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 12)
        return $0
    }(UILabel())
    
    var thumbnail: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.backgroundColor = UIColor(red: 0.82, green: 0.82, blue: 0.84, alpha: 1.0)
        return $0
    }(UIImageView())
    
    lazy var overlay: OverlayView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isHidden = true
        return $0
    }(OverlayView(style: .solid))
    
    lazy var checkin: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 19)
        button.titleLabel?.textColor = .white
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = UIColor(red: 1.00, green: 0.18, blue: 0.33, alpha: 1.0)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.setTitle(WPStrings.checkinLabel, for: .normal)
        return button
    }()
    
    // MARK: - Private variables
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 18
        return stackView
    }()
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EventDetailView {
    
    // MARK: - Internal methods
    
    func configure(name: String, date: String, price: String, desc: String, thumbnail: URL) {
        self.name.text = name
        self.date.text = date
        self.price.text = price
        self.desc.text = desc
        self.thumbnail.load(url: thumbnail)
    }
    
    func showLoading() {
        overlay.isHidden = false
    }
    
    func showError() {
        overlay.isHidden = true
    }
    
    func disableButton() {
        overlay.isHidden = true
        checkin.setTitle(WPStrings.successCheckinMessage, for: .normal)
        checkin.isUserInteractionEnabled = false
    }
    
    func showData() {}
        
    // MARK: - Private methods
    
    private func setup() {
        backgroundColor = .white
        addComponents()
        addConstraints()
    }
    
    private func addComponents() {
        stackView.addArrangedSubview(thumbnail)
        stackView.addArrangedSubview(name)
        stackView.addArrangedSubview(date)
        stackView.addArrangedSubview(price)
        stackView.addArrangedSubview(desc)
        stackView.addArrangedSubview(checkin)
        scrollView.addSubview(stackView)
        addSubview(scrollView)
        addSubview(overlay)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            thumbnail.heightAnchor.constraint(equalToConstant: 240)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: widthAnchor, constant: -32),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            overlay.leftAnchor.constraint(equalTo: leftAnchor),
            overlay.rightAnchor.constraint(equalTo: rightAnchor),
            overlay.topAnchor.constraint(equalTo: topAnchor),
            overlay.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}
