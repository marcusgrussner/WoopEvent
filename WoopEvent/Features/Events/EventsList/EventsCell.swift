import UIKit

// MARK: - Class

final class EventsCell: UITableViewCell {
    
    // MARK: - Internal variables
    
    static let identifier = String(describing: EventsCell.self)
    
    let containerView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        return $0
    }(UIView())
    
    let name: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    let date: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    let price: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 12)
        return $0
    }(UILabel())
    
    var thumbnail: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.backgroundColor = UIColor(red: 0.82, green: 0.82, blue: 0.84, alpha: 1.0)
        return $0
    }(UIImageView())
    
    // MARK: - Private variables
    
    private lazy var stackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = 5.0
        return $0
    }(UIStackView())
    
    // MARK: - Initializers
    
    override init(style _: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupLayout()
        selectionStyle = .none
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        containerView.setShadow()
        super.layoutSubviews()
    }
}

extension EventsCell {
    
    // MARK: - Internal methods
    
    public func configure(imageURL: URL?, title: String?, date: Date?, price: Double?) {
        if let imageURL = imageURL {
            self.thumbnail.load(url: imageURL)
        }
        
        if let title = title {
            self.name.text = title
        }
        
        if let date = date {
            self.date.text = date.format
        }
        
        if let price = price {
            self.price.text = price.toCurrency
        }
    }
        
    // MARK: - Private methods
    
    private func setupLayout() {
        addComponents()
        setupThumbnail()
        setupStackView()
        setupContainerView()
    }
    
    private func addComponents() {
        contentView.addSubview(containerView)
        containerView.addSubview(thumbnail)
        stackView.addArrangedSubview(name)
        stackView.addArrangedSubview(date)
        stackView.addArrangedSubview(price)
        containerView.addSubview(stackView)
    }
    
    private func setupContainerView() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5.0),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15.0),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5.0),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15.0)
        ])
    }
    
    private func setupThumbnail() {
        NSLayoutConstraint.activate([
            thumbnail.topAnchor.constraint(equalTo: containerView.topAnchor),
            thumbnail.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            thumbnail.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            thumbnail.widthAnchor.constraint(equalToConstant: 120.0),
            thumbnail.heightAnchor.constraint(equalToConstant: 100.0)
        ])
    }
    
    private func setupStackView() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10.0),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5.0),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10.0),
            stackView.leadingAnchor.constraint(equalTo: thumbnail.trailingAnchor, constant: 20.0)
        ])
    }
}
