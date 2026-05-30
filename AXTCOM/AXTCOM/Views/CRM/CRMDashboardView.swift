import SwiftUI

struct CRMDashboardView: View {
    @EnvironmentObject var appState: AppState
    @State private var selectedPipeline: Pipeline = .all

    enum Pipeline: String, CaseIterable {
        case all = "All Leads"
        case new = "New"
        case contacted = "Contacted"
        case qualified = "Qualified"
        case closed = "Closed"
    }

    var pipelineContacts: [Contact] {
        switch selectedPipeline {
        case .all:       return appState.contacts
        case .new:       return appState.contacts.filter { $0.leadScore < 50 }
        case .contacted: return appState.contacts.filter { $0.lastContacted != nil && $0.leadScore < 70 }
        case .qualified: return appState.contacts.filter { $0.leadScore >= 70 && $0.leadScore < 90 }
        case .closed:    return appState.contacts.filter { $0.leadScore >= 90 }
        }
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Summary Cards
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        PipelineStatCard(label: "Total Leads",   value: "\(appState.contacts.count)",  color: .axtBlue,   icon: "person.2.fill")
                        PipelineStatCard(label: "Hot Leads",     value: "\(appState.contacts.filter { $0.leadScore >= 80 }.count)", color: .axtGreen, icon: "flame.fill")
                        PipelineStatCard(label: "Avg Score",     value: avgScore,                       color: .axtPurple, icon: "chart.bar.fill")
                        PipelineStatCard(label: "Synced to CRM", value: "\(appState.crmIntegrations.first(where: { $0.isConnected })?.contactsSynced ?? 0)", color: .axtOrange, icon: "arrow.triangle.2.circlepath")
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 14)
                }

                // Pipeline Filter
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(Pipeline.allCases, id: \.self) { stage in
                            FilterChip(label: stage.rawValue, isSelected: selectedPipeline == stage) {
                                selectedPipeline = stage
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 10)
                }

                // Kanban-style list
                List {
                    ForEach(pipelineContacts) { contact in
                        NavigationLink(destination: ContactDetailView(contact: contact)) {
                            CRMLeadRow(contact: contact)
                        }
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.axtBackground)
                        .listRowInsets(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
                    }
                    Spacer().frame(height: 20).listRowBackground(Color.clear).listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                .background(Color.axtBackground)
            }
            .background(Color.axtBackground.ignoresSafeArea())
            .navigationTitle("CRM Pipeline")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "arrow.triangle.2.circlepath")
                            .foregroundColor(.axtBlue)
                    }
                }
            }
        }
    }

    var avgScore: String {
        guard !appState.contacts.isEmpty else { return "0" }
        let avg = appState.contacts.map(\.leadScore).reduce(0, +) / appState.contacts.count
        return "\(avg)"
    }
}

struct PipelineStatCard: View {
    let label: String
    let value: String
    let color: Color
    let icon: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: icon)
                    .font(.system(size: 14))
                    .foregroundColor(color)
                Spacer()
            }
            Text(value)
                .font(.title2.bold())
                .foregroundColor(.axtTextPrimary)
            Text(label)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(14)
        .frame(width: 130)
        .background(Color.white)
        .cornerRadius(14)
        .shadow(color: Color.black.opacity(0.04), radius: 6, y: 2)
    }
}

struct CRMLeadRow: View {
    let contact: Contact

    var stageColor: Color {
        contact.leadScore >= 90 ? .axtGreen :
        contact.leadScore >= 70 ? .axtBlue  :
        contact.leadScore >= 50 ? .axtOrange : .secondary
    }

    var stageLabel: String {
        contact.leadScore >= 90 ? "Closed" :
        contact.leadScore >= 70 ? "Qualified" :
        contact.leadScore >= 50 ? "Contacted" : "New"
    }

    var body: some View {
        HStack(spacing: 14) {
            ZStack {
                Circle()
                    .fill(contact.avatarColor.opacity(0.15))
                    .frame(width: 44, height: 44)
                Text(contact.initials)
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(contact.avatarColor)
            }

            VStack(alignment: .leading, spacing: 3) {
                Text(contact.fullName)
                    .font(.subheadline.bold())
                    .foregroundColor(.axtTextPrimary)
                Text(contact.company)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()

            VStack(alignment: .trailing, spacing: 4) {
                Text(stageLabel)
                    .font(.system(size: 11, weight: .bold))
                    .foregroundColor(stageColor)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 3)
                    .background(stageColor.opacity(0.1))
                    .cornerRadius(6)
                LeadScoreBadge(score: contact.leadScore)
            }
        }
        .padding(14)
        .background(Color.white)
        .cornerRadius(14)
        .shadow(color: Color.black.opacity(0.04), radius: 6, y: 2)
    }
}
