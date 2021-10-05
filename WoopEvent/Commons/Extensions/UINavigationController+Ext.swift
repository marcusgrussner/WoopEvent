import UIKit

// MARK: - UINavigationController extensions

extension UINavigationController {
    
    func setNavigationBarStyle() {
        navigationBar.prefersLargeTitles = true
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navigationBar.standardAppearance = navigationBarAppearance
    }
}
