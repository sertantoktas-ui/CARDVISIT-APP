import Foundation
import SwiftUI

struct Contact: Identifiable, Codable, Hashable {
    var id: UUID = UUID()
    var firstName: String
    var lastName: String
    var company: String
    var jobTitle: String
    var email: String
    var phone: String
    var website: String
    var linkedIn: String
    var twitter: String
    var address: String
    var notes: String
    var tags: [String]
    var isFavorite: Bool
    var dateAdded: Date
    var lastContacted: Date?
    var profileImageData: Data?
    var cardImageData: Data?
    var leadScore: Int // 0-100
    var source: ContactSource

    var fullName: String { "\(firstName) \(lastName)" }
    var initials: String {
        let f = firstName.first.map(String.init) ?? ""
        let l = lastName.first.map(String.init) ?? ""
        return "\(f)\(l)".uppercased()
    }

    var avatarColor: Color {
        let colors: [Color] = [.axtBlue, .axtPurple, .axtGreen, .axtOrange, .axtPink]
        let index = abs(fullName.hashValue) % colors.count
        return colors[index]
    }

    enum ContactSource: String, Codable {
        case scan = "Card Scan"
        case manual = "Manual"
        case qrCode = "QR Code"
        case linkedin = "LinkedIn"
        case badge = "Event Badge"
        case voice = "Voice"
    }

    static let sampleData: [Contact] = [
        Contact(firstName: "Ahmet", lastName: "Yılmaz", company: "Tech Ventures", jobTitle: "CEO", email: "ahmet@techventures.com", phone: "+90 532 111 2233", website: "techventures.com", linkedIn: "linkedin.com/in/ahmetyilmaz", twitter: "@ahmetyilmaz", address: "Levent, Istanbul", notes: "Met at TechSummit 2025", tags: ["investor", "tech"], isFavorite: true, dateAdded: Date(), lastContacted: Date(), profileImageData: nil, cardImageData: nil, leadScore: 85, source: .scan),
        Contact(firstName: "Sara", lastName: "Johnson", company: "Global Innovations", jobTitle: "CTO", email: "sara@globalinno.com", phone: "+1 415 555 0192", website: "globalinno.com", linkedIn: "linkedin.com/in/sarajohnson", twitter: "@sarajohnson", address: "San Francisco, CA", notes: "Partner opportunity", tags: ["partner", "tech", "US"], isFavorite: false, dateAdded: Date().addingTimeInterval(-86400), lastContacted: nil, profileImageData: nil, cardImageData: nil, leadScore: 72, source: .linkedin),
        Contact(firstName: "Mehmet", lastName: "Kaya", company: "Fintech Plus", jobTitle: "VP Sales", email: "mehmet@fintechplus.co", phone: "+90 212 555 7890", website: "fintechplus.co", linkedIn: "linkedin.com/in/mehmetkaya", twitter: "", address: "Maslak, Istanbul", notes: "", tags: ["fintech", "sales"], isFavorite: true, dateAdded: Date().addingTimeInterval(-172800), lastContacted: Date().addingTimeInterval(-43200), profileImageData: nil, cardImageData: nil, leadScore: 91, source: .badge),
        Contact(firstName: "Emily", lastName: "Chen", company: "Design Studio", jobTitle: "Creative Director", email: "emily@designstudio.io", phone: "+44 20 7946 0958", website: "designstudio.io", linkedIn: "linkedin.com/in/emilychen", twitter: "@emilychen", address: "London, UK", notes: "Potential collaboration", tags: ["design", "creative"], isFavorite: false, dateAdded: Date().addingTimeInterval(-259200), lastContacted: nil, profileImageData: nil, cardImageData: nil, leadScore: 60, source: .scan),
        Contact(firstName: "Carlos", lastName: "Rodriguez", company: "LatAm Growth", jobTitle: "Business Dev", email: "carlos@latamgrowth.com", phone: "+52 55 1234 5678", website: "latamgrowth.com", linkedIn: "linkedin.com/in/carlosrodriguez", twitter: "@carlosr", address: "Mexico City", notes: "Spanish market expansion", tags: ["latam", "growth"], isFavorite: false, dateAdded: Date().addingTimeInterval(-345600), lastContacted: Date().addingTimeInterval(-86400), profileImageData: nil, cardImageData: nil, leadScore: 55, source: .qrCode)
    ]
}
