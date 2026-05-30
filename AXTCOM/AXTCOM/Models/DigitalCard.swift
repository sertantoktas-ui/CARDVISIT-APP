import Foundation
import SwiftUI

struct DigitalCard: Identifiable, Codable {
    var id: UUID = UUID()
    var ownerName: String
    var jobTitle: String
    var company: String
    var email: String
    var phone: String
    var website: String
    var linkedIn: String
    var twitter: String
    var colorScheme: CardColorScheme
    var cardStyle: CardStyle
    var logoData: Data?
    var profileImageData: Data?
    var isActive: Bool
    var viewCount: Int
    var shareCount: Int

    enum CardColorScheme: String, Codable, CaseIterable {
        case midnight = "Midnight"
        case ocean = "Ocean"
        case forest = "Forest"
        case sunset = "Sunset"
        case lavender = "Lavender"
        case slate = "Slate"

        var gradient: [Color] {
            switch self {
            case .midnight: return [Color(hex: "0A0E27"), Color(hex: "1A237E")]
            case .ocean: return [Color(hex: "006994"), Color(hex: "00BCD4")]
            case .forest: return [Color(hex: "1B5E20"), Color(hex: "4CAF50")]
            case .sunset: return [Color(hex: "BF360C"), Color(hex: "FF9800")]
            case .lavender: return [Color(hex: "4A148C"), Color(hex: "CE93D8")]
            case .slate: return [Color(hex: "263238"), Color(hex: "546E7A")]
            }
        }
    }

    enum CardStyle: String, Codable, CaseIterable {
        case gloss = "Gloss"
        case matte = "Matte"
        case bamboo = "Bamboo"
        case metal = "Metal"
    }

    static let sampleData: [DigitalCard] = [
        DigitalCard(ownerName: "Alex Morgan", jobTitle: "Founder & CEO", company: "AXTCOM", email: "alex@axtcom.io", phone: "+1 800 298 7624", website: "axtcom.io", linkedIn: "linkedin.com/in/alexmorgan", twitter: "@alexmorgan", colorScheme: .midnight, cardStyle: .gloss, logoData: nil, profileImageData: nil, isActive: true, viewCount: 142, shareCount: 38)
    ]
}

struct UserProfile: Identifiable, Codable {
    var id: UUID = UUID()
    var firstName: String
    var lastName: String
    var email: String
    var company: String
    var jobTitle: String
    var phone: String
    var profileImageData: Data?
}
