import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var appState: AppState
    @State private var showTeam = false
    @State private var showCRM = false
    @State private var showSecurity = false
    @State private var notificationsEnabled = true
    @State private var aiEnrichmentEnabled = true
    @State private var autoSyncEnabled = true

    var body: some View {
        NavigationView {
            List {
                // Profile Section
                Section {
                    HStack(spacing: 14) {
                        ZStack {
                            LinearGradient.axtBrand
                                .frame(width: 60, height: 60)
                                .cornerRadius(16)
                            Text((appState.currentUser?.firstName.prefix(1) ?? "A").uppercased())
                                .font(.title2.bold())
                                .foregroundColor(.white)
                        }
                        VStack(alignment: .leading, spacing: 3) {
                            Text(appState.currentUser?.firstName ?? "User")
                                .font(.headline)
                                .foregroundColor(.axtTextPrimary)
                            Text(appState.currentUser?.email ?? "user@axtcom.io")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Text(appState.currentUser?.jobTitle ?? "Pro Member")
                                .font(.caption)
                                .foregroundColor(.axtBlue)
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 4)
                }

                // Upgrade Banner
                Section {
                    ZStack {
                        LinearGradient(colors: [Color(hex: "4A148C"), Color.axtBlue], startPoint: .leading, endPoint: .trailing)
                            .cornerRadius(12)
                        HStack(spacing: 14) {
                            Image(systemName: "star.circle.fill")
                                .font(.system(size: 32))
                                .foregroundColor(.yellow)
                            VStack(alignment: .leading, spacing: 3) {
                                Text("Upgrade to Pro")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Text("Unlock AI enrichment, team sync & unlimited scans")
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.8))
                            }
                            Spacer()
                        }
                        .padding(14)
                    }
                    .listRowInsets(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
                    .listRowBackground(Color.clear)
                }

                // Features
                Section("Features") {
                    NavigationLink(destination: TeamView()) {
                        SettingsRow(icon: "person.3.fill", label: "Team & Sharing", color: .axtGreen)
                    }
                    NavigationLink(destination: CRMView()) {
                        SettingsRow(icon: "arrow.triangle.2.circlepath", label: "CRM Integrations", color: .axtBlue)
                    }
                    SettingsRow(icon: "brain.head.profile", label: "AI Settings", color: .axtPurple)
                    SettingsRow(icon: "tag.fill", label: "Tags & Categories", color: .axtOrange)
                    SettingsRow(icon: "globe", label: "Language Settings", color: .axtGreen, badge: "60+")
                }

                // Preferences
                Section("Preferences") {
                    HStack {
                        SettingsRow(icon: "bell.fill", label: "Push Notifications", color: .axtOrange)
                        Spacer()
                        Toggle("", isOn: $notificationsEnabled).tint(.axtBlue)
                    }
                    HStack {
                        SettingsRow(icon: "wand.and.stars", label: "AI Lead Enrichment", color: .axtPurple)
                        Spacer()
                        Toggle("", isOn: $aiEnrichmentEnabled).tint(.axtBlue)
                    }
                    HStack {
                        SettingsRow(icon: "arrow.up.arrow.down.circle.fill", label: "Auto CRM Sync", color: .axtBlue)
                        Spacer()
                        Toggle("", isOn: $autoSyncEnabled).tint(.axtBlue)
                    }
                }

                // Security
                Section("Security & Privacy") {
                    SettingsRow(icon: "lock.shield.fill", label: "Security Center", color: .axtBlue, badge: "ISO 27001")
                    SettingsRow(icon: "hand.raised.fill", label: "Privacy Settings", color: .axtGreen)
                    SettingsRow(icon: "key.fill", label: "Two-Factor Auth", color: .axtOrange)
                }

                // Support
                Section("Support") {
                    SettingsRow(icon: "questionmark.circle.fill", label: "Help & FAQ", color: .secondary)
                    SettingsRow(icon: "envelope.fill", label: "Contact Support", color: .axtBlue)
                    SettingsRow(icon: "star.fill", label: "Rate AXTCOM", color: .yellow)
                }

                // Account
                Section {
                    Button(action: {
                        appState.isOnboarded = false
                        UserDefaults.standard.set(false, forKey: "isOnboarded")
                    }) {
                        Text("Sign Out")
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
            }
            .listStyle(.insetGrouped)
            .background(Color.axtBackground.ignoresSafeArea())
            .navigationTitle("More")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct SettingsRow: View {
    let icon: String
    let label: String
    let color: Color
    var badge: String? = nil

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 14))
                .foregroundColor(color)
                .frame(width: 30, height: 30)
                .background(color.opacity(0.12))
                .cornerRadius(8)
            Text(label)
                .font(.body)
                .foregroundColor(.axtTextPrimary)
            Spacer()
            if let badge = badge {
                Text(badge)
                    .font(.caption.bold())
                    .foregroundColor(.axtBlue)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 3)
                    .background(Color.axtBlue.opacity(0.1))
                    .cornerRadius(8)
            }
        }
    }
}

// MARK: - Team View
struct TeamView: View {
    @EnvironmentObject var appState: AppState
    @State private var showInvite = false

    var body: some View {
        List {
            Section("Team Members (\(appState.teamMembers.count))") {
                ForEach(appState.teamMembers) { member in
                    HStack(spacing: 14) {
                        ZStack {
                            Circle()
                                .fill(Color.axtBlue.opacity(0.12))
                                .frame(width: 44, height: 44)
                            Text(String(member.name.prefix(1)).uppercased())
                                .font(.headline.bold())
                                .foregroundColor(.axtBlue)
                        }
                        VStack(alignment: .leading, spacing: 3) {
                            Text(member.name)
                                .font(.subheadline.bold())
                            Text("\(member.role.rawValue) · \(member.contactsShared) contacts shared")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        Circle()
                            .fill(member.isActive ? Color.axtGreen : Color.secondary.opacity(0.3))
                            .frame(width: 8, height: 8)
                    }
                }
            }
            Section {
                Button(action: { showInvite = true }) {
                    Label("Invite Team Member", systemImage: "person.badge.plus")
                        .foregroundColor(.axtBlue)
                }
            }
        }
        .navigationTitle("Team")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - CRM View
struct CRMView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        List {
            Section("Connected Integrations") {
                ForEach(appState.crmIntegrations) { integration in
                    HStack(spacing: 14) {
                        Image(systemName: integration.icon)
                            .font(.system(size: 20))
                            .foregroundColor(integration.isConnected ? .axtBlue : .secondary)
                            .frame(width: 40, height: 40)
                            .background((integration.isConnected ? Color.axtBlue : Color.gray).opacity(0.1))
                            .cornerRadius(10)

                        VStack(alignment: .leading, spacing: 3) {
                            Text(integration.name)
                                .font(.subheadline.bold())
                            if integration.isConnected {
                                Text("\(integration.contactsSynced) contacts synced")
                                    .font(.caption)
                                    .foregroundColor(.axtGreen)
                            } else {
                                Text("Not connected")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                        Spacer()
                        if integration.isConnected {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.axtGreen)
                        } else {
                            Text("Connect")
                                .font(.caption.bold())
                                .foregroundColor(.axtBlue)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(Color.axtBlue.opacity(0.1))
                                .cornerRadius(8)
                        }
                    }
                }
            }
        }
        .navigationTitle("CRM Integrations")
        .navigationBarTitleDisplayMode(.inline)
    }
}
