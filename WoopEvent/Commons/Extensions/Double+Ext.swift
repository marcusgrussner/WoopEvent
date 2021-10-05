import Foundation

// MARK: - Double extensions

extension Double {
    
    var toCurrency: String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "pt_br")
        formatter.numberStyle = .currency
        if let formattedTipAmount = formatter.string(from: self as NSNumber) {
            return formattedTipAmount
        }
        return ""
    }
}
