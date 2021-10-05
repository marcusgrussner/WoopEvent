import UIKit

// MARK: - Class

final class OverlayView: UIView {
    
    // MARK: - Public variables
    
    public enum Style {
        case solid, transparent
    }
    
    public var overlayStyle: Style = .solid {
        didSet {
            updateLayout()
        }
    }
    
    // MARK: - Private variables
    
    private lazy var indicator: UIActivityIndicatorView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.startAnimating()
        return $0
    }(UIActivityIndicatorView(style: .large))
    
    // MARK: - Initializers
    
    init(style: Style) {
        super.init(frame: .zero)
        setupLayout()
        overlayStyle = style
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OverlayView {

    // MARK: - Private methods
    
    private func updateLayout() {
        switch overlayStyle {
        case .solid:
            backgroundColor = .white
        case .transparent:
            backgroundColor = UIColor.black.withAlphaComponent(0.5)
        }
    }
    
    private func setupLayout() {
        addComponents()
        setupIndicatiorConstraints()
    }

    private func addComponents() {
        addSubview(indicator)
    }

    private func setupIndicatiorConstraints() {
        NSLayoutConstraint.activate([
            indicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            indicator.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
