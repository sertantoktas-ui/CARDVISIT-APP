import SwiftUI

struct TeamCollaborationView: View {
    @EnvironmentObject var appState: AppState
    @State private var showInvite = false
    @State private var showSharedContacts = false

    var body: some View {
        NavigationView {
            List {
                // Team overview banner
                Section {
                    ZStack(alignment: .leading) {
                        LinearGradient(
                            colors: [Color(hex: "0D47A1"), Color.axtLightBlue],
                            startPoint: .leading, endPoint: .trailing
                        )
                        .cornerRadius(14)

                        HStack(spacing: 16) {
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Your Team")
                                    .font(.headline).foregroundColor(.white)
                                Text("\(appState.teamMembers.filter(\.isActive).count) active · \(appState.contacts.count) shared contacts")
                                    .font(.caption).foregroundColor(.white.opacity(0.8))
                            }
                            Spacer()
                            // Stacked avatars
                            HStack(spacing: -10) {
                                ForEach(appState.teamMembers.prefix(3)) { m in
                                    ZStack {
                                        Circle().fill(Color.white).frame(width: 32, height: 32)
                                        Circle().fill(Color.axtBlue.opacity(0.25)).frame(width: 28, height: 28)
                                        Text(String(m.name.prefix(1)))
                                            .font(.system(size: 12, weight: .bold))
                                            .foregroundColor(.axtBlue)
                                    }
                                }
                            }
                        }
                        .padding(16)
                    }
                    .listRowInsets(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                }

                // Members
                Section("Members") {
                    ForEach(appState.teamMembers) { member in
                        HStack(spacing: 14) {
                            ZStack {
                                Circle()
                                    .fill(member.isActive ? Color.axtBlue.opacity(0.12) : Color.gray.opacity(0.1))
                                    .frame(width: 46, height: 46)
                                Text(String(member.name.prefix(1)).uppercased())
                                    .font(.system(size: 17, weight: .bold))
                                    .foregroundColor(member.isActive ? .axtBlue : .gray)
                            }
                            .overlay(
                                Circle()
                                    .fill(member.isActive ? Color.axtGreen : Color.gray.opacity(0.4))
                                    .frame(width: 12, height: 12)
                                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                    .offset(x: 16, y: 16),
                                alignment: .bottomTrailing
                            )

                            VStack(alignment: .leading, spacing: 3) {
                                Text(member.name)
                                    .font(.subheadline.bold())
                                    .foregroundColor(.axtTextPrimary)
                                Text(member.email)
                                    .font(.caption).foregroundColor(.secondary)
                            }

                            Spacer()

                            VStack(alignment: .trailing, spacing: 4) {
                                Text(member.role.rawValue)
                                    .font(.system(size: 11, weight: .semibold))
                                    .foregroundColor(member.role == .admin ? .axtOrange : .axtBlue)
                                    .padding(.horizontal, 8).padding(.vertical, 3)
                                    .background((member.role == .admin ? Color.axtOrange : Color.axtBlue).opacity(0.1))
                                    .cornerRadius(6)
                                Text("\(member.contactsShared) contacts")
                                    .font(.caption2).foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }

                // Shared Activity
                Section("Recent Activity") {
                    ActivityRow(member: "Jordan Lee", action: "scanned", item: "3 new contacts", icon: "viewfinder", color: .axtBlue, time: "2m ago")
                    ActivityRow(member: "Taylor Kim", action: "synced", item: "HubSpot export", icon: "arrow.triangle.2.circlepath", color: .axtGreen, time: "1h ago")
                    ActivityRow(member: "You", action: "added", item: "Carlos Rodriguez", icon: "person.badge.plus", color: .axtPurple, time: "3h ago")
                }

                // Invite CTA
                Section {
                    Button(action: { showInvite = true }) {
                        HStack {
                            Image(systemName: "person.badge.plus")
                                .foregroundColor(.axtBlue)
                            Text("Invite Team Member")
                                .foregroundColor(.axtBlue)
                                .font(.subheadline.bold())
                        }
                    }
                }
            }
            .listStyle(.insetGrouped)
            .background(Color.axtBackground.ignoresSafeArea())
            .navigationTitle("Team")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showInvite = true }) {
                        Image(systemName: "person.badge.plus")
                            .foregroundColor(.axtBlue)
                    }
                }
            }
        }
        .sheet(isPresented: $showInvite) {
            InviteMemberView()
        }
    }
}

struct ActivityRow: View {
    let member: String
    let action: String
    let item: String
    let icon: String
    let color: Color
    let time: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 14))
                .foregroundColor(color)
                .frame(width: 34, height: 34)
                .background(color.opacity(0.1))
                .cornerRadius(10)

            VStack(alignment: .leading, spacing: 2) {
                (Text(member).bold() + Text(" \(action) ") + Text(item).foregroundColor(.axtBlue).bold())
                    .font(.subheadline)
                    .foregroundColor(.axtTextPrimary)
                Text(time)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 2)
    }
}

struct InviteMemberView: View {
    @Environment(\.dismiss) var dismiss
    @State private var email = ""
    @State private var role: TeamMember.TeamRole = .member

    var body: some View {
        NavigationView {
            Form {
                Section("Invite Details") {
                    HStack(spacing: 10) {
                        Image(systemName: "envelope").foregroundColor(.axtBlue)
                        TextField("Email address", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                    }
                    Picker("Role", selection: $role) {
                        ForEach(TeamMember.TeamRole.allCases, id: \.self) { r in
                            Text(r.rawValue).tag(r)
                        }
                    }
                }
                Section {
                    VStack(alignment: .leading, spacing: 6) {
                        Label("Admin – full access & settings", systemImage: "shield.fill").font(.caption).foregroundColor(.axtOrange)
                        Label("Member – scan, view & share contacts", systemImage: "person.fill").font(.caption).foregroundColor(.axtBlue)
                        Label("Viewer – read-only access", systemImage: "eye.fill").font(.caption).foregroundColor(.secondary)
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Invite Member")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) { Button("Cancel") { dismiss() } }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Send Invite") { dismiss() }
                        .bold().foregroundColor(.axtBlue)
                        .disabled(email.isEmpty)
                }
            }
        }
    }
}
