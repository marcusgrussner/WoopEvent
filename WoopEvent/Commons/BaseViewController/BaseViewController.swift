import UIKit

// MARK: - Class

// swiftlint:disable force_cast
class BaseViewController<View: UIView>: UIViewController {
    
    // MARK: - Internal variables
    
    var customView: View {
        return view as! View
    }
    
    // MARK: - Initializers

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Override methods
    
    override func loadView() {
        view = View()
    }
}
