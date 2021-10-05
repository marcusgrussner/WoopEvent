// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable function_parameter_count identifier_name line_length type_body_length
internal enum WPStrings {
  /// Check-in
  internal static let checkinLabel = WPStrings.tr("Localizable", "checkinLabel")
  /// Não há eventos cadastrados no momento.
  internal static let eventListEmptyMessage = WPStrings.tr("Localizable", "eventListEmptyMessage")
  /// Não foi possível carregar a lista de eventos.
  internal static let eventListErrorLoad = WPStrings.tr("Localizable", "eventListErrorLoad")
  /// Check-in realizado com sucesso
  internal static let successCheckinMessage = WPStrings.tr("Localizable", "successCheckinMessage")
  /// Detalhes
  internal static let titleEventDetail = WPStrings.tr("Localizable", "titleEventDetail")
  /// Eventos
  internal static let titleListEvents = WPStrings.tr("Localizable", "titleListEvents")
  /// Tentar Novamente
  internal static let tryAgain = WPStrings.tr("Localizable", "tryAgain")
}
// swiftlint:enable function_parameter_count identifier_name line_length type_body_length

// MARK: - Implementation Details

extension WPStrings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
