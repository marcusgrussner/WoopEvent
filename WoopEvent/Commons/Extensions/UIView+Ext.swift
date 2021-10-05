import UIKit

// MARK: - UIView Extensions

extension UIView {
    
    func setShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowOffset = .zero
        self.layer.shadowColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.00).cgColor
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 4
    }
}
