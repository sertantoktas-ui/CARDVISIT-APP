import SwiftUI

struct ContactDetailView: View {
    let contact: Contact
    @State private var showShare = false
    @State private var showEdit = false
    @State private var isFavorite: Bool

    init(contact: Contact) {
        self.contact = contact
        _isFavorite = State(initialValue: contact.isFavorite)
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Hero Header
                ZStack(alignment: .bottom) {
                    LinearGradient(
                        colors: [contact.avatarColor.opacity(0.9), contact.avatarColor.opacity(0.5)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .frame(height: 180)

                    VStack(spacing: 8) {
                        ZStack {
                            Circle()
                                .fill(Color.white.opacity(0.25))
                                .frame(width: 80, height: 80)
                            Text(contact.initials)
                                .font(.system(size: 32, weight: .black))
                                .foregroundColor(.white)
                        }
                        .overlay(Circle().stroke(Color.white, lineWidth: 3))

                        Text(contact.fullName)
                            .font(.title2.bold())
                            .foregroundColor(.white)
                        Text(contact.jobTitle.isEmpty ? contact.company : "\(contact.jobTitle) · \(contact.company)")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.85))
                    }
                    .padding(.bottom, 20)
                }

                // Action Buttons
                HStack(spacing: 12) {
                    DetailActionButton(icon: "phone.fill", label: "Call", color: .axtGreen) {
                        if let url = URL(string: "tel:\(contact.phone)") { UIApplication.shared.open(url) }
                    }
                    DetailActionButton(icon: "envelope.fill", label: "Email", color: .axtBlue) {
                        if let url = URL(string: "mailto:\(contact.email)") { UIApplication.shared.open(url) }
                    }
                    DetailActionButton(icon: "message.fill", label: "Message", color: .axtPurple) {}
                    DetailActionButton(icon: "square.and.arrow.up", label: "Share", color: .axtOrange) {
                        showShare = true
                    }
                }
                .padding(16)
                .background(Color.white)

                VStack(spacing: 16) {
                    // Lead Score Card
                    InfoSection(title: "Lead Intelligence") {
                        VStack(spacing: 12) {
                            HStack {
                                Text("Lead Score")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                Spacer()
                                Text("\(contact.leadScore)/100")
                                    .font(.subheadline.bold())
                                    .foregroundColor(contact.leadScore >= 80 ? .axtGreen : .axtOrange)
                            }
                            ProgressView(value: Double(contact.leadScore) / 100.0)
                                .tint(contact.leadScore >= 80 ? Color.axtGreen : Color.axtOrange)
                                .scaleEffect(x: 1, y: 2, anchor: .center)
                                .cornerRadius(4)

                            HStack {
                                Label("Source: \(contact.source.rawValue)", systemImage: "arrow.down.circle")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                Spacer()
                                if let lastContact = contact.lastContacted {
                                    Label("Last: \(lastContact.formatted(date: .abbreviated, time: .omitted))", systemImage: "clock")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }

                    // Contact Info
                    InfoSection(title: "Contact Information") {
                        VStack(spacing: 12) {
                            if !contact.email.isEmpty {
                                ContactInfoRow(icon: "envelope.fill", label: "Email", value: contact.email, color: .axtBlue)
                            }
                            if !contact.phone.isEmpty {
                                ContactInfoRow(icon: "phone.fill", label: "Phone", value: contact.phone, color: .axtGreen)
                            }
                            if !contact.website.isEmpty {
                                ContactInfoRow(icon: "globe", label: "Website", value: contact.website, color: .axtPurple)
                            }
                            if !contact.address.isEmpty {
                                ContactInfoRow(icon: "location.fill", label: "Address", value: contact.address, color: .axtOrange)
                            }
                        }
                    }

                    // Social
                    if !contact.linkedIn.isEmpty || !contact.twitter.isEmpty {
                        InfoSection(title: "Social Profiles") {
                            VStack(spacing: 12) {
                                if !contact.linkedIn.isEmpty {
                                    ContactInfoRow(icon: "link", label: "LinkedIn", value: contact.linkedIn, color: Color(hex: "0A66C2"))
                                }
                                if !contact.twitter.isEmpty {
                                    ContactInfoRow(icon: "link", label: "Twitter/X", value: contact.twitter, color: Color(hex: "1DA1F2"))
                                }
                            }
                        }
                    }

                    // Tags
                    if !contact.tags.isEmpty {
                        InfoSection(title: "Tags") {
                            FlowLayout(spacing: 8) {
                                ForEach(contact.tags, id: \.self) { tag in
                                    Text("#\(tag)")
                                        .font(.subheadline.bold())
                                        .foregroundColor(.axtBlue)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                        .background(Color.axtBlue.opacity(0.1))
                                        .cornerRadius(20)
                                }
                            }
                        }
                    }

                    // Notes
                    if !contact.notes.isEmpty {
                        InfoSection(title: "Notes") {
                            Text(contact.notes)
                                .font(.body)
                                .foregroundColor(.axtTextPrimary)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }

                    // AI Follow-up Suggestion
                    InfoSection(title: "AI Suggested Follow-up") {
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(spacing: 8) {
                                Image(systemName: "brain.head.profile")
                                    .foregroundColor(.axtPurple)
                                Text("Personalized message suggestion")
                                    .font(.caption.bold())
                                    .foregroundColor(.axtPurple)
                            }
                            Text("Hi \(contact.firstName), it was great connecting at the event. I'd love to explore how we can collaborate on the project we discussed. Are you available for a quick call this week?")
                                .font(.subheadline)
                                .foregroundColor(.axtTextPrimary)
                                .padding(12)
                                .background(Color.axtPurple.opacity(0.06))
                                .cornerRadius(10)

                            Button(action: {}) {
                                Label("Use This Message", systemImage: "paperplane.fill")
                                    .font(.subheadline.bold())
                                    .foregroundColor(.axtPurple)
                            }
                        }
                    }

                    Spacer(minLength: 20)
                }
                .padding(.top, 16)
                .padding(.horizontal, 16)
            }
        }
        .background(Color.axtBackground.ignoresSafeArea())
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack(spacing: 12) {
                    Button(action: { isFavorite.toggle() }) {
                        Image(systemName: isFavorite ? "star.fill" : "star")
                            .foregroundColor(isFavorite ? .yellow : .secondary)
                    }
                    Button(action: { showEdit = true }) {
                        Text("Edit")
                            .foregroundColor(.axtBlue)
                    }
                }
            }
        }
        .sheet(isPresented: $showEdit) {
            AddContactView(existingContact: contact)
        }
    }
}

struct InfoSection<Content: View>: View {
    let title: String
    let content: Content

    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.subheadline.bold())
                .foregroundColor(.axtTextSecondary)
            content
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.04), radius: 6, y: 2)
    }
}

struct ContactInfoRow: View {
    let icon: String
    let label: String
    let value: String
    let color: Color

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 14))
                .foregroundColor(color)
                .frame(width: 32, height: 32)
                .background(color.opacity(0.1))
                .cornerRadius(8)

            VStack(alignment: .leading, spacing: 1) {
                Text(label)
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text(value)
                    .font(.subheadline)
                    .foregroundColor(.axtTextPrimary)
            }
            Spacer()
        }
    }
}

struct DetailActionButton: View {
    let icon: String
    let label: String
    let color: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 6) {
                ZStack {
                    Circle()
                        .fill(color.opacity(0.12))
                        .frame(width: 44, height: 44)
                    Image(systemName: icon)
                        .font(.system(size: 18))
                        .foregroundColor(color)
                }
                Text(label)
                    .font(.caption.bold())
                    .foregroundColor(.axtTextPrimary)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct FlowLayout: Layout {
    var spacing: CGFloat = 8

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let rows = computeRows(proposal: proposal, subviews: subviews)
        let height = rows.map { $0.map { $0.sizeThatFits(.unspecified).height }.max() ?? 0 }.reduce(0, +) + spacing * CGFloat(rows.count - 1)
        return CGSize(width: proposal.width ?? 0, height: height)
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let rows = computeRows(proposal: proposal, subviews: subviews)
        var y = bounds.minY
        for row in rows {
            var x = bounds.minX
            let rowHeight = row.map { $0.sizeThatFits(.unspecified).height }.max() ?? 0
            for subview in row {
                let size = subview.sizeThatFits(.unspecified)
                subview.place(at: CGPoint(x: x, y: y), proposal: ProposedViewSize(size))
                x += size.width + spacing
            }
            y += rowHeight + spacing
        }
    }

    private func computeRows(proposal: ProposedViewSize, subviews: Subviews) -> [[LayoutSubview]] {
        var rows: [[LayoutSubview]] = [[]]
        var rowWidth: CGFloat = 0
        let maxWidth = proposal.width ?? .infinity
        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            if rowWidth + size.width > maxWidth, !rows[rows.count - 1].isEmpty {
                rows.append([])
                rowWidth = 0
            }
            rows[rows.count - 1].append(subview)
            rowWidth += size.width + spacing
        }
        return rows
    }
}
