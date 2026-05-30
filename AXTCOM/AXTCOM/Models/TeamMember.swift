import Foundation

struct TeamMember: Identifiable, Codable {
    var id: UUID = UUID()
    var name: String
    var email: String
    var role: TeamRole
    var contactsShared: Int
    var isActive: Bool
    var joinDate: Date

    enum TeamRole: String, Codable, CaseIterable {
        case admin = "Admin"
        case member = "Member"
        case viewer = "Viewer"
    }

    static let sampleData: [TeamMember] = [
        TeamMember(name: "You (Owner)", email: "you@company.com", role: .admin, contactsShared: 124, isActive: true, joinDate: Date().addingTimeInterval(-2592000)),
        TeamMember(name: "Jordan Lee", email: "jordan@company.com", role: .member, contactsShared: 87, isActive: true, joinDate: Date().addingTimeInterval(-1296000)),
        TeamMember(name: "Taylor Kim", email: "taylor@company.com", role: .member, contactsShared: 53, isActive: true, joinDate: Date().addingTimeInterval(-604800)),
        TeamMember(name: "Casey Park", email: "casey@company.com", role: .viewer, contactsShared: 12, isActive: false, joinDate: Date().addingTimeInterval(-259200))
    ]
}

struct CRMIntegration: Identifiable, Codable {
    var id: UUID = UUID()
    var name: String
    var icon: String
    var isConnected: Bool
    var lastSync: Date?
    var contactsSynced: Int

    static let sampleData: [CRMIntegration] = [
        CRMIntegration(name: "Salesforce", icon: "cloud.fill", isConnected: true, lastSync: Date().addingTimeInterval(-3600), contactsSynced: 98),
        CRMIntegration(name: "HubSpot", icon: "arrow.triangle.2.circlepath", isConnected: false, lastSync: nil, contactsSynced: 0),
        CRMIntegration(name: "Pipedrive", icon: "chart.bar.fill", isConnected: false, lastSync: nil, contactsSynced: 0),
        CRMIntegration(name: "Zoho CRM", icon: "building.2.fill", isConnected: false, lastSync: nil, contactsSynced: 0)
    ]
}
