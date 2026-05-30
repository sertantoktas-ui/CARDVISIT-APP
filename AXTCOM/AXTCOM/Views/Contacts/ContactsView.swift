import SwiftUI

struct ContactsView: View {
    @EnvironmentObject var appState: AppState
    @State private var searchText = ""
    @State private var selectedFilter: ContactFilter = .all
    @State private var showAddContact = false
    @State private var sortOption: SortOption = .nameAsc

    enum ContactFilter: String, CaseIterable {
        case all = "All"
        case favorites = "Favorites"
        case recent = "Recent"
        case highLead = "Hot Leads"
    }

    enum SortOption: String, CaseIterable {
        case nameAsc = "Name A-Z"
        case nameDesc = "Name Z-A"
        case dateAdded = "Date Added"
        case leadScore = "Lead Score"
    }

    var filteredContacts: [Contact] {
        var contacts = appState.contacts

        switch selectedFilter {
        case .favorites: contacts = contacts.filter { $0.isFavorite }
        case .recent: contacts = contacts.sorted { $0.dateAdded > $1.dateAdded }
        case .highLead: contacts = contacts.filter { $0.leadScore >= 75 }
        case .all: break
        }

        if !searchText.isEmpty {
            contacts = contacts.filter {
                $0.fullName.localizedCaseInsensitiveContains(searchText) ||
                $0.company.localizedCaseInsensitiveContains(searchText) ||
                $0.jobTitle.localizedCaseInsensitiveContains(searchText) ||
                $0.email.localizedCaseInsensitiveContains(searchText)
            }
        }

        switch sortOption {
        case .nameAsc: contacts.sort { $0.lastName < $1.lastName }
        case .nameDesc: contacts.sort { $0.lastName > $1.lastName }
        case .dateAdded: contacts.sort { $0.dateAdded > $1.dateAdded }
        case .leadScore: contacts.sort { $0.leadScore > $1.leadScore }
        }

        return contacts
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Search bar
                HStack(spacing: 12) {
                    HStack(spacing: 8) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.secondary)
                        TextField("Search contacts...", text: $searchText)
                            .autocapitalization(.none)
                    }
                    .padding(.horizontal, 12)
                    .frame(height: 44)
                    .background(Color.white)
                    .cornerRadius(12)
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.axtGray, lineWidth: 1))

                    Menu {
                        ForEach(SortOption.allCases, id: \.self) { option in
                            Button(option.rawValue) { sortOption = option }
                        }
                    } label: {
                        Image(systemName: "arrow.up.arrow.down")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.axtBlue)
                            .frame(width: 44, height: 44)
                            .background(Color.white)
                            .cornerRadius(12)
                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.axtGray, lineWidth: 1))
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(Color.axtBackground)

                // Filter Chips
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(ContactFilter.allCases, id: \.self) { filter in
                            FilterChip(label: filter.rawValue, isSelected: selectedFilter == filter) {
                                selectedFilter = filter
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 10)
                }
                .background(Color.axtBackground)

                // Contact List
                if filteredContacts.isEmpty {
                    Spacer()
                    VStack(spacing: 12) {
                        Image(systemName: "person.2.slash")
                            .font(.system(size: 48))
                            .foregroundColor(.secondary.opacity(0.4))
                        Text("No contacts found")
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                } else {
                    List {
                        ForEach(filteredContacts) { contact in
                            NavigationLink(destination: ContactDetailView(contact: contact)) {
                                ContactListRow(contact: contact)
                            }
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.axtBackground)
                            .listRowInsets(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
                        }
                        .onDelete { _ in }
                        Spacer().frame(height: 70).listRowBackground(Color.clear).listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                    .background(Color.axtBackground)
                }
            }
            .background(Color.axtBackground.ignoresSafeArea())
            .navigationTitle("Contacts")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showAddContact = true }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 22))
                            .foregroundColor(.axtBlue)
                    }
                }
            }
        }
        .sheet(isPresented: $showAddContact) {
            AddContactView()
        }
    }
}

struct ContactListRow: View {
    let contact: Contact

    var body: some View {
        HStack(spacing: 14) {
            ZStack {
                Circle()
                    .fill(contact.avatarColor.opacity(0.15))
                    .frame(width: 48, height: 48)
                Text(contact.initials)
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(contact.avatarColor)
            }

            VStack(alignment: .leading, spacing: 3) {
                HStack(spacing: 6) {
                    Text(contact.fullName)
                        .font(.subheadline.bold())
                        .foregroundColor(.axtTextPrimary)
                    if contact.isFavorite {
                        Image(systemName: "star.fill")
                            .font(.system(size: 10))
                            .foregroundColor(.yellow)
                    }
                }
                Text(contact.jobTitle.isEmpty ? contact.company : "\(contact.jobTitle) · \(contact.company)")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                if !contact.tags.isEmpty {
                    HStack(spacing: 4) {
                        ForEach(contact.tags.prefix(2), id: \.self) { tag in
                            Text(tag)
                                .font(.system(size: 10, weight: .medium))
                                .foregroundColor(.axtBlue)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 2)
                                .background(Color.axtBlue.opacity(0.1))
                                .cornerRadius(4)
                        }
                    }
                }
            }

            Spacer()

            VStack(alignment: .trailing, spacing: 4) {
                LeadScoreBadge(score: contact.leadScore)
                Text(contact.source.rawValue)
                    .font(.system(size: 9))
                    .foregroundColor(.secondary)
            }
        }
        .padding(14)
        .background(Color.white)
        .cornerRadius(14)
        .shadow(color: Color.black.opacity(0.04), radius: 6, y: 2)
    }
}

struct FilterChip: View {
    let label: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.subheadline.bold())
                .foregroundColor(isSelected ? .white : .axtTextPrimary)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(isSelected ? LinearGradient.axtBrand : LinearGradient(colors: [Color.white, Color.white], startPoint: .leading, endPoint: .trailing))
                .cornerRadius(20)
                .shadow(color: isSelected ? Color.axtBlue.opacity(0.3) : Color.clear, radius: 6, y: 2)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(isSelected ? Color.clear : Color.axtGray, lineWidth: 1)
                )
        }
    }
}
