import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    // Header Banner
                    ZStack(alignment: .bottom) {
                        LinearGradient.axtBrand
                            .frame(height: 180)
                            .ignoresSafeArea(edges: .top)

                        VStack(alignment: .leading, spacing: 4) {
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Good morning 👋")
                                        .font(.subheadline)
                                        .foregroundColor(.white.opacity(0.8))
                                    Text(appState.currentUser?.firstName ?? "Welcome")
                                        .font(.title.bold())
                                        .foregroundColor(.white)
                                }
                                Spacer()
                                ZStack {
                                    Circle()
                                        .fill(Color.white.opacity(0.2))
                                        .frame(width: 48, height: 48)
                                    Text((appState.currentUser?.firstName.prefix(1) ?? "A").uppercased())
                                        .font(.headline.bold())
                                        .foregroundColor(.white)
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)
                    }

                    VStack(spacing: 20) {
                        // Stats Row
                        HStack(spacing: 12) {
                            StatCard(title: "Contacts", value: "\(appState.contacts.count)", icon: "person.2.fill", color: .axtBlue)
                            StatCard(title: "Cards Shared", value: "38", icon: "square.and.arrow.up.fill", color: .axtPurple)
                            StatCard(title: "Team", value: "\(appState.teamMembers.count)", icon: "person.3.fill", color: .axtGreen)
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 20)

                        // Quick Actions
                        VStack(alignment: .leading, spacing: 12) {
                            SectionHeader(title: "Quick Actions")
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 12) {
                                    QuickActionButton(icon: "viewfinder", label: "Scan Card", color: .axtBlue) {
                                        appState.selectedTab = 2
                                    }
                                    QuickActionButton(icon: "qrcode", label: "My QR Code", color: .axtPurple) {
                                        appState.selectedTab = 3
                                    }
                                    QuickActionButton(icon: "person.badge.plus", label: "Add Contact", color: .axtGreen) {
                                        appState.selectedTab = 1
                                    }
                                    QuickActionButton(icon: "mic.fill", label: "Voice Add", color: .axtOrange) {}
                                }
                                .padding(.horizontal, 16)
                            }
                        }

                        // Recent Contacts
                        VStack(alignment: .leading, spacing: 12) {
                            SectionHeader(title: "Recent Contacts", actionLabel: "See All") {
                                appState.selectedTab = 1
                            }
                            VStack(spacing: 8) {
                                ForEach(appState.contacts.prefix(3)) { contact in
                                    NavigationLink(destination: ContactDetailView(contact: contact)) {
                                        ContactRowCard(contact: contact)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                            .padding(.horizontal, 16)
                        }

                        // AI Insights
                        AIInsightsBanner()
                            .padding(.horizontal, 16)

                        // Follow-up Reminders
                        VStack(alignment: .leading, spacing: 12) {
                            SectionHeader(title: "Follow-up Reminders")
                            VStack(spacing: 8) {
                                FollowUpCard(name: "Mehmet Kaya", company: "Fintech Plus", daysAgo: 1)
                                FollowUpCard(name: "Sara Johnson", company: "Global Innovations", daysAgo: 3)
                            }
                            .padding(.horizontal, 16)
                        }

                        Spacer(minLength: 80)
                    }
                }
            }
            .background(Color.axtBackground.ignoresSafeArea())
            .navigationBarHidden(true)
        }
    }
}

struct StatCard: View {
    let title: String
    let value: String
    let icon: String
    let color: Color

    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: icon)
                .font(.system(size: 22))
                .foregroundColor(color)
            Text(value)
                .font(.title2.bold())
                .foregroundColor(.axtTextPrimary)
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.04), radius: 8, y: 2)
    }
}

struct QuickActionButton: View {
    let icon: String
    let label: String
    let color: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                ZStack {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(color.opacity(0.12))
                        .frame(width: 52, height: 52)
                    Image(systemName: icon)
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(color)
                }
                Text(label)
                    .font(.caption.bold())
                    .foregroundColor(.axtTextPrimary)
            }
        }
    }
}

struct SectionHeader: View {
    let title: String
    var actionLabel: String? = nil
    var action: (() -> Void)? = nil

    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .foregroundColor(.axtTextPrimary)
            Spacer()
            if let label = actionLabel, let action = action {
                Button(action: action) {
                    Text(label)
                        .font(.subheadline)
                        .foregroundColor(.axtBlue)
                }
            }
        }
        .padding(.horizontal, 16)
    }
}

struct ContactRowCard: View {
    let contact: Contact

    var body: some View {
        HStack(spacing: 14) {
            ZStack {
                Circle()
                    .fill(contact.avatarColor.opacity(0.15))
                    .frame(width: 44, height: 44)
                Text(contact.initials)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(contact.avatarColor)
            }

            VStack(alignment: .leading, spacing: 2) {
                Text(contact.fullName)
                    .font(.subheadline.bold())
                    .foregroundColor(.axtTextPrimary)
                Text("\(contact.jobTitle) · \(contact.company)")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
            Spacer()

            VStack(alignment: .trailing, spacing: 4) {
                LeadScoreBadge(score: contact.leadScore)
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(14)
        .background(Color.white)
        .cornerRadius(14)
        .shadow(color: Color.black.opacity(0.04), radius: 6, y: 2)
    }
}

struct LeadScoreBadge: View {
    let score: Int
    var color: Color {
        score >= 80 ? .axtGreen : score >= 50 ? .axtOrange : .secondary
    }
    var body: some View {
        Text("\(score)")
            .font(.caption.bold())
            .foregroundColor(color)
            .padding(.horizontal, 6)
            .padding(.vertical, 2)
            .background(color.opacity(0.12))
            .cornerRadius(6)
    }
}

struct AIInsightsBanner: View {
    var body: some View {
        HStack(spacing: 14) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.axtPurple.opacity(0.12))
                    .frame(width: 48, height: 48)
                Image(systemName: "brain.head.profile")
                    .font(.system(size: 22))
                    .foregroundColor(.axtPurple)
            }
            VStack(alignment: .leading, spacing: 3) {
                Text("AI Insight")
                    .font(.caption.bold())
                    .foregroundColor(.axtPurple)
                Text("3 contacts are ready for follow-up. Tap to see AI-suggested messages.")
                    .font(.subheadline)
                    .foregroundColor(.axtTextPrimary)
                    .lineLimit(2)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(14)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.04), radius: 6, y: 2)
    }
}

struct FollowUpCard: View {
    let name: String
    let company: String
    let daysAgo: Int

    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: "bell.fill")
                .font(.system(size: 18))
                .foregroundColor(.axtOrange)
                .frame(width: 36, height: 36)
                .background(Color.axtOrange.opacity(0.1))
                .cornerRadius(10)

            VStack(alignment: .leading, spacing: 2) {
                Text(name)
                    .font(.subheadline.bold())
                    .foregroundColor(.axtTextPrimary)
                Text(company)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text(daysAgo == 1 ? "Yesterday" : "\(daysAgo)d ago")
                .font(.caption)
                .foregroundColor(.secondary)

            Button(action: {}) {
                Text("Follow Up")
                    .font(.caption.bold())
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(Color.axtBlue)
                    .cornerRadius(8)
            }
        }
        .padding(14)
        .background(Color.white)
        .cornerRadius(14)
        .shadow(color: Color.black.opacity(0.04), radius: 6, y: 2)
    }
}
