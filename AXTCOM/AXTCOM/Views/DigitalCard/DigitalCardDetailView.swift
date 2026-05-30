import SwiftUI

struct DigitalCardDetailView: View {
    let card: DigitalCard
    @State private var showQRCode = false

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Card Preview
                DigitalCardPreview(card: card)
                    .padding(.horizontal, 16)
                    .padding(.top, 8)

                // Share Buttons
                HStack(spacing: 12) {
                    Button(action: { showQRCode = true }) {
                        Label("Show QR", systemImage: "qrcode")
                            .font(.subheadline.bold())
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 48)
                            .background(LinearGradient.axtBrand)
                            .cornerRadius(12)
                    }
                    Button(action: {}) {
                        Label("Share Link", systemImage: "link")
                            .font(.subheadline.bold())
                            .foregroundColor(.axtBlue)
                            .frame(maxWidth: .infinity)
                            .frame(height: 48)
                            .background(Color.axtBlue.opacity(0.1))
                            .cornerRadius(12)
                    }
                }
                .padding(.horizontal, 16)

                // Stats
                InfoSection(title: "Card Performance") {
                    HStack(spacing: 0) {
                        StatItem(value: "\(card.viewCount)", label: "Views")
                        Divider().frame(height: 40)
                        StatItem(value: "\(card.shareCount)", label: "Shares")
                        Divider().frame(height: 40)
                        StatItem(value: "27", label: "Saves")
                    }
                }
                .padding(.horizontal, 16)

                // Contact Details
                InfoSection(title: "Card Information") {
                    VStack(spacing: 12) {
                        ContactInfoRow(icon: "envelope.fill", label: "Email", value: card.email, color: .axtBlue)
                        ContactInfoRow(icon: "phone.fill", label: "Phone", value: card.phone, color: .axtGreen)
                        ContactInfoRow(icon: "globe", label: "Website", value: card.website, color: .axtPurple)
                        ContactInfoRow(icon: "link", label: "LinkedIn", value: card.linkedIn, color: Color(hex: "0A66C2"))
                    }
                }
                .padding(.horizontal, 16)

                Spacer(minLength: 40)
            }
        }
        .background(Color.axtBackground.ignoresSafeArea())
        .navigationTitle("My Card")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showQRCode) {
            QRCodeView(card: card)
        }
    }
}

struct StatItem: View {
    let value: String
    let label: String

    var body: some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.title2.bold())
                .foregroundColor(.axtTextPrimary)
            Text(label)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
    }
}

struct QRCodeView: View {
    let card: DigitalCard
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 24) {
            Text("Scan to Connect")
                .font(.title2.bold())
                .foregroundColor(.axtTextPrimary)
                .padding(.top, 32)

            // QR Code placeholder
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.08), radius: 16, y: 4)
                    .frame(width: 240, height: 240)

                VStack(spacing: 12) {
                    Image(systemName: "qrcode")
                        .font(.system(size: 140))
                        .foregroundColor(.axtTextPrimary)
                }

                // Logo overlay
                ZStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 48, height: 48)
                    AXTCOMLogo(size: 32)
                }
            }

            Text("\(card.ownerName)")
                .font(.headline)
                .foregroundColor(.axtTextPrimary)
            Text(card.company)
                .font(.subheadline)
                .foregroundColor(.secondary)

            HStack(spacing: 12) {
                Button(action: {}) {
                    Label("Download", systemImage: "arrow.down.circle.fill")
                        .font(.subheadline.bold())
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(LinearGradient.axtBrand)
                        .cornerRadius(12)
                }
                Button(action: {}) {
                    Label("Share", systemImage: "square.and.arrow.up")
                        .font(.subheadline.bold())
                        .foregroundColor(.axtBlue)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.axtBlue.opacity(0.1))
                        .cornerRadius(12)
                }
            }
            .padding(.horizontal, 24)

            Button("Close") { dismiss() }
                .foregroundColor(.secondary)
                .padding(.bottom, 20)
        }
        .background(Color.axtBackground.ignoresSafeArea())
    }
}

struct CreateDigitalCardView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var jobTitle = ""
    @State private var company = ""
    @State private var email = ""
    @State private var phone = ""
    @State private var selectedScheme: DigitalCard.CardColorScheme = .midnight
    @State private var selectedStyle: DigitalCard.CardStyle = .gloss

    var body: some View {
        NavigationView {
            Form {
                Section("Your Info") {
                    TextField("Full Name", text: $name)
                    TextField("Job Title", text: $jobTitle)
                    TextField("Company", text: $company)
                    TextField("Email", text: $email).keyboardType(.emailAddress)
                    TextField("Phone", text: $phone).keyboardType(.phonePad)
                }
                Section("Card Design") {
                    Picker("Color Theme", selection: $selectedScheme) {
                        ForEach(DigitalCard.CardColorScheme.allCases, id: \.self) {
                            Text($0.rawValue).tag($0)
                        }
                    }
                    Picker("Card Style", selection: $selectedStyle) {
                        ForEach(DigitalCard.CardStyle.allCases, id: \.self) {
                            Text($0.rawValue).tag($0)
                        }
                    }
                }
            }
            .navigationTitle("Create Card")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) { Button("Cancel") { dismiss() } }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Create") { dismiss() }.bold().foregroundColor(.axtBlue)
                }
            }
        }
    }
}
