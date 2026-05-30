import SwiftUI
import AVFoundation

struct CardScannerView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var appState: AppState
    @State private var scanMode: ScanMode = .camera
    @State private var isScanning = false
    @State private var showResult = false
    @State private var scannedContact: Contact? = nil
    @State private var showVoiceInput = false

    enum ScanMode: String, CaseIterable {
        case camera = "Card"
        case qrCode = "QR Code"
        case linkedin = "LinkedIn"
        case badge = "Badge"
        case voice = "Voice"
    }

    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()

                VStack(spacing: 0) {
                    // Mode Selector
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(ScanMode.allCases, id: \.self) { mode in
                                Button(action: {
                                    scanMode = mode
                                    if mode == .voice { showVoiceInput = true }
                                }) {
                                    Text(mode.rawValue)
                                        .font(.subheadline.bold())
                                        .foregroundColor(scanMode == mode ? .axtBlue : .white.opacity(0.6))
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 8)
                                        .background(scanMode == mode ? Color.white : Color.white.opacity(0.1))
                                        .cornerRadius(20)
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                    }

                    // Camera Viewfinder Simulation
                    ZStack {
                        Color(white: 0.08)
                            .cornerRadius(24)

                        // Scan Frame
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(
                                LinearGradient(colors: [Color.axtAccent, Color.axtBlue], startPoint: .topLeading, endPoint: .bottomTrailing),
                                lineWidth: 2.5
                            )
                            .frame(width: 300, height: 180)
                            .overlay(
                                ZStack {
                                    // Corner markers
                                    ForEach(0..<4) { i in
                                        CornerMarker()
                                            .rotationEffect(.degrees(Double(i) * 90))
                                            .offset(
                                                x: i == 0 || i == 3 ? -140 : 140,
                                                y: i == 0 || i == 1 ? -80 : 80
                                            )
                                    }

                                    // Scan line animation
                                    if isScanning {
                                        ScanLineView()
                                    }
                                }
                            )

                        VStack(spacing: 12) {
                            Spacer()
                            if !isScanning {
                                VStack(spacing: 8) {
                                    Image(systemName: scanMode == .voice ? "mic.circle.fill" : "viewfinder.circle.fill")
                                        .font(.system(size: 44))
                                        .foregroundColor(.axtAccent)
                                    Text(scanMode == .voice ? "Tap to record contact info" : "Position card within frame")
                                        .font(.subheadline)
                                        .foregroundColor(.white.opacity(0.7))
                                        .multilineTextAlignment(.center)
                                }
                                .padding(.bottom, 20)
                            }
                        }
                    }
                    .frame(height: 300)
                    .padding(.horizontal, 16)

                    // Language note
                    HStack {
                        Image(systemName: "globe")
                            .font(.caption)
                        Text("Supports 60+ languages including Turkish, English, Arabic, Chinese...")
                            .font(.caption)
                    }
                    .foregroundColor(.white.opacity(0.5))
                    .padding(.horizontal, 24)
                    .padding(.top, 12)

                    Spacer()

                    // Action Buttons
                    VStack(spacing: 16) {
                        // Capture Button
                        Button(action: simulateScan) {
                            ZStack {
                                Circle()
                                    .fill(LinearGradient.axtBrand)
                                    .frame(width: 72, height: 72)
                                    .shadow(color: Color.axtBlue.opacity(0.5), radius: 16, y: 4)

                                if isScanning {
                                    ProgressView().tint(.white).scaleEffect(1.2)
                                } else {
                                    Image(systemName: scanMode == .voice ? "mic.fill" : "camera.fill")
                                        .font(.system(size: 28, weight: .semibold))
                                        .foregroundColor(.white)
                                }
                            }
                        }
                        .disabled(isScanning)

                        HStack(spacing: 32) {
                            Button(action: {}) {
                                VStack(spacing: 4) {
                                    Image(systemName: "photo.on.rectangle")
                                        .font(.system(size: 22))
                                        .foregroundColor(.white.opacity(0.7))
                                    Text("Gallery")
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.6))
                                }
                            }
                            Button(action: {}) {
                                VStack(spacing: 4) {
                                    Image(systemName: "bolt.fill")
                                        .font(.system(size: 22))
                                        .foregroundColor(.white.opacity(0.7))
                                    Text("Flash")
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.6))
                                }
                            }
                        }
                    }
                    .padding(.bottom, 40)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 22))
                            .foregroundColor(.white.opacity(0.7))
                    }
                }
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 6) {
                        AXTCOMLogo(size: 24)
                        Text("Scan")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .sheet(isPresented: $showResult) {
            if let contact = scannedContact {
                ScanResultView(contact: contact) {
                    dismiss()
                }
            }
        }
        .sheet(isPresented: $showVoiceInput) {
            VoiceCaptureView()
        }
    }

    private func simulateScan() {
        isScanning = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            isScanning = false
            scannedContact = Contact(
                firstName: "David", lastName: "Park",
                company: "Nexus Capital", jobTitle: "Investment Director",
                email: "david@nexuscapital.com", phone: "+1 650 555 0123",
                website: "nexuscapital.com", linkedIn: "linkedin.com/in/davidpark",
                twitter: "@davidpark", address: "Palo Alto, CA",
                notes: "Scanned via \(scanMode.rawValue)", tags: ["investor", "vc"],
                isFavorite: false, dateAdded: Date(), lastContacted: nil,
                profileImageData: nil, cardImageData: nil,
                leadScore: Int.random(in: 55...95),
                source: scanMode == .camera ? .scan : scanMode == .qrCode ? .qrCode : scanMode == .linkedin ? .linkedin : .badge
            )
            showResult = true
        }
    }
}

struct CornerMarker: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 0, y: 14))
            path.addLine(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 14, y: 0))
        }
        .stroke(Color.axtAccent, style: StrokeStyle(lineWidth: 3, lineCap: .round))
        .frame(width: 14, height: 14)
    }
}

struct ScanLineView: View {
    @State private var offset: CGFloat = -70

    var body: some View {
        Rectangle()
            .fill(
                LinearGradient(colors: [Color.clear, Color.axtAccent.opacity(0.8), Color.clear], startPoint: .leading, endPoint: .trailing)
            )
            .frame(width: 290, height: 2)
            .offset(y: offset)
            .onAppear {
                withAnimation(.linear(duration: 1.5).repeatForever(autoreverses: true)) {
                    offset = 70
                }
            }
    }
}

struct ScanResultView: View {
    let contact: Contact
    let onSave: () -> Void
    @EnvironmentObject var appState: AppState
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Success Badge
                    VStack(spacing: 12) {
                        ZStack {
                            Circle()
                                .fill(Color.axtGreen.opacity(0.12))
                                .frame(width: 72, height: 72)
                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: 40))
                                .foregroundColor(.axtGreen)
                        }
                        Text("Card Scanned!")
                            .font(.title2.bold())
                            .foregroundColor(.axtTextPrimary)
                        Text("Review and save the extracted contact")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.top, 24)

                    // Scanned Card Preview
                    VStack(spacing: 12) {
                        HStack(spacing: 14) {
                            ZStack {
                                Circle()
                                    .fill(contact.avatarColor.opacity(0.15))
                                    .frame(width: 56, height: 56)
                                Text(contact.initials)
                                    .font(.title3.bold())
                                    .foregroundColor(contact.avatarColor)
                            }
                            VStack(alignment: .leading, spacing: 3) {
                                Text(contact.fullName)
                                    .font(.headline)
                                Text(contact.jobTitle)
                                    .font(.subheadline).foregroundColor(.secondary)
                                Text(contact.company)
                                    .font(.subheadline.bold()).foregroundColor(.axtBlue)
                            }
                            Spacer()
                            LeadScoreBadge(score: contact.leadScore)
                        }

                        Divider()

                        VStack(spacing: 10) {
                            if !contact.email.isEmpty {
                                ContactInfoRow(icon: "envelope.fill", label: "Email", value: contact.email, color: .axtBlue)
                            }
                            if !contact.phone.isEmpty {
                                ContactInfoRow(icon: "phone.fill", label: "Phone", value: contact.phone, color: .axtGreen)
                            }
                            if !contact.website.isEmpty {
                                ContactInfoRow(icon: "globe", label: "Website", value: contact.website, color: .axtPurple)
                            }
                        }
                    }
                    .padding(16)
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(color: Color.black.opacity(0.06), radius: 8, y: 2)
                    .padding(.horizontal, 16)

                    // AI Lead Enrichment note
                    HStack(spacing: 10) {
                        Image(systemName: "brain.head.profile")
                            .foregroundColor(.axtPurple)
                        Text("AI is enriching this contact with public data for better insights...")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .padding(12)
                    .background(Color.axtPurple.opacity(0.06))
                    .cornerRadius(10)
                    .padding(.horizontal, 16)

                    // Action buttons
                    VStack(spacing: 12) {
                        Button(action: {
                            appState.contacts.insert(contact, at: 0)
                            onSave()
                            dismiss()
                        }) {
                            Label("Save Contact", systemImage: "person.badge.plus")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 54)
                                .background(LinearGradient.axtBrand)
                                .cornerRadius(14)
                        }

                        Button(action: { dismiss() }) {
                            Text("Discard")
                                .font(.subheadline.bold())
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 30)
                }
            }
            .background(Color.axtBackground.ignoresSafeArea())
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct VoiceCaptureView: View {
    @Environment(\.dismiss) var dismiss
    @State private var isRecording = false
    @State private var transcript = ""

    var body: some View {
        VStack(spacing: 32) {
            Spacer()
            ZStack {
                ForEach(0..<3) { i in
                    Circle()
                        .stroke(Color.axtBlue.opacity(isRecording ? 0.15 : 0.05), lineWidth: 1)
                        .frame(width: CGFloat(100 + i * 40), height: CGFloat(100 + i * 40))
                        .scaleEffect(isRecording ? 1.2 : 1.0)
                        .animation(.easeInOut(duration: 1.0).repeatForever().delay(Double(i) * 0.2), value: isRecording)
                }
                ZStack {
                    Circle()
                        .fill(isRecording ? LinearGradient.axtBrand : LinearGradient(colors: [Color.gray.opacity(0.2), Color.gray.opacity(0.3)], startPoint: .top, endPoint: .bottom))
                        .frame(width: 90, height: 90)
                    Image(systemName: isRecording ? "stop.fill" : "mic.fill")
                        .font(.system(size: 34))
                        .foregroundColor(isRecording ? .white : .gray)
                }
            }

            Text(isRecording ? "Listening..." : "Tap to record")
                .font(.title2.bold())
                .foregroundColor(.axtTextPrimary)

            Text("Say something like: \"John Smith, CEO at Apple, john@apple.com, plus one four one five five five zero one two three\"")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)

            Button(action: { isRecording.toggle() }) {
                Text(isRecording ? "Stop Recording" : "Start Recording")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 54)
                    .background(isRecording ? Color.red : LinearGradient.axtBrand)
                    .cornerRadius(14)
            }
            .padding(.horizontal, 24)

            Button("Cancel") { dismiss() }
                .foregroundColor(.secondary)

            Spacer()
        }
        .background(Color.axtBackground.ignoresSafeArea())
    }
}
