import SwiftUI

struct AddContactView: View {
    @EnvironmentObject var appState: AppState
    @Environment(\.dismiss) var dismiss
    var existingContact: Contact?

    @State private var firstName = ""
    @State private var lastName = ""
    @State private var company = ""
    @State private var jobTitle = ""
    @State private var email = ""
    @State private var phone = ""
    @State private var website = ""
    @State private var linkedIn = ""
    @State private var twitter = ""
    @State private var address = ""
    @State private var notes = ""
    @State private var tags = ""
    @State private var isFavorite = false

    var isEditing: Bool { existingContact != nil }

    var body: some View {
        NavigationView {
            Form {
                Section("Personal") {
                    HStack {
                        TextField("First Name", text: $firstName)
                        TextField("Last Name", text: $lastName)
                    }
                    TextField("Job Title", text: $jobTitle)
                    TextField("Company", text: $company)
                }

                Section("Contact") {
                    HStack(spacing: 8) {
                        Image(systemName: "envelope").foregroundColor(.axtBlue)
                        TextField("Email", text: $email).keyboardType(.emailAddress).autocapitalization(.none)
                    }
                    HStack(spacing: 8) {
                        Image(systemName: "phone").foregroundColor(.axtGreen)
                        TextField("Phone", text: $phone).keyboardType(.phonePad)
                    }
                    HStack(spacing: 8) {
                        Image(systemName: "globe").foregroundColor(.axtPurple)
                        TextField("Website", text: $website).keyboardType(.URL).autocapitalization(.none)
                    }
                }

                Section("Social") {
                    HStack(spacing: 8) {
                        Image(systemName: "link").foregroundColor(Color(hex: "0A66C2"))
                        TextField("LinkedIn URL", text: $linkedIn).autocapitalization(.none)
                    }
                    HStack(spacing: 8) {
                        Image(systemName: "link").foregroundColor(Color(hex: "1DA1F2"))
                        TextField("Twitter/X Handle", text: $twitter).autocapitalization(.none)
                    }
                }

                Section("Details") {
                    HStack(spacing: 8) {
                        Image(systemName: "location").foregroundColor(.axtOrange)
                        TextField("Address", text: $address)
                    }
                    HStack(spacing: 8) {
                        Image(systemName: "tag").foregroundColor(.axtBlue)
                        TextField("Tags (comma separated)", text: $tags).autocapitalization(.none)
                    }
                }

                Section("Notes") {
                    TextEditor(text: $notes)
                        .frame(minHeight: 80)
                }

                Section {
                    Toggle(isOn: $isFavorite) {
                        Label("Mark as Favorite", systemImage: "star.fill")
                    }
                    .tint(.yellow)
                }
            }
            .navigationTitle(isEditing ? "Edit Contact" : "New Contact")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") { save() }
                        .bold()
                        .foregroundColor(.axtBlue)
                        .disabled(firstName.isEmpty)
                }
            }
            .onAppear { populateIfEditing() }
        }
    }

    private func populateIfEditing() {
        guard let c = existingContact else { return }
        firstName = c.firstName; lastName = c.lastName
        company = c.company; jobTitle = c.jobTitle
        email = c.email; phone = c.phone
        website = c.website; linkedIn = c.linkedIn
        twitter = c.twitter; address = c.address
        notes = c.notes; tags = c.tags.joined(separator: ", ")
        isFavorite = c.isFavorite
    }

    private func save() {
        let tagList = tags.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }
        let newContact = Contact(
            id: existingContact?.id ?? UUID(),
            firstName: firstName, lastName: lastName,
            company: company, jobTitle: jobTitle,
            email: email, phone: phone, website: website,
            linkedIn: linkedIn, twitter: twitter, address: address,
            notes: notes, tags: tagList, isFavorite: isFavorite,
            dateAdded: existingContact?.dateAdded ?? Date(),
            lastContacted: existingContact?.lastContacted,
            profileImageData: nil, cardImageData: nil,
            leadScore: existingContact?.leadScore ?? Int.random(in: 40...90),
            source: existingContact?.source ?? .manual
        )
        if let idx = appState.contacts.firstIndex(where: { $0.id == newContact.id }) {
            appState.contacts[idx] = newContact
        } else {
            appState.contacts.insert(newContact, at: 0)
        }
        dismiss()
    }
}
