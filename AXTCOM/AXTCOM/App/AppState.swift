import SwiftUI
import Combine

class AppState: ObservableObject {
    @Published var isOnboarded: Bool = UserDefaults.standard.bool(forKey: "isOnboarded")
    @Published var currentUser: UserProfile? = nil
    @Published var selectedTab: Int = 0
    @Published var contacts: [Contact] = Contact.sampleData
    @Published var digitalCards: [DigitalCard] = DigitalCard.sampleData
    @Published var teamMembers: [TeamMember] = TeamMember.sampleData
    @Published var crmIntegrations: [CRMIntegration] = CRMIntegration.sampleData

    func completeOnboarding(user: UserProfile) {
        currentUser = user
        isOnboarded = true
        UserDefaults.standard.set(true, forKey: "isOnboarded")
    }
}
