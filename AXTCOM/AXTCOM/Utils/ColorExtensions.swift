import SwiftUI

extension Color {
    // AXTCOM Brand Colors
    static let axtBlue = Color(hex: "1565C0")
    static let axtLightBlue = Color(hex: "1E88E5")
    static let axtAccent = Color(hex: "00B0FF")
    static let axtPurple = Color(hex: "7B1FA2")
    static let axtGreen = Color(hex: "2E7D32")
    static let axtOrange = Color(hex: "E65100")
    static let axtPink = Color(hex: "AD1457")
    static let axtBackground = Color(hex: "F5F7FF")
    static let axtSurface = Color.white
    static let axtGray = Color(hex: "F0F2F8")
    static let axtTextPrimary = Color(hex: "1A1A2E")
    static let axtTextSecondary = Color(hex: "5C6BC0")

    static let axtGradientStart = Color(hex: "0D47A1")
    static let axtGradientEnd = Color(hex: "1565C0")

    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

extension LinearGradient {
    static let axtBrand = LinearGradient(
        colors: [Color.axtGradientStart, Color.axtLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    static let axtCard = LinearGradient(
        colors: [Color(hex: "0A0E27"), Color(hex: "1A237E")],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
