import SwiftUI

struct DigitalCardListView: View {
    @EnvironmentObject var appState: AppState
    @State private var showCreateCard = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // My Active Card
                    if let card = appState.digitalCards.first {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("My Digital Card")
                                .font(.headline)
                                .foregroundColor(.axtTextPrimary)
                                .padding(.horizontal, 16)

                            NavigationLink(destination: DigitalCardDetailView(card: card)) {
                                DigitalCardPreview(card: card)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .padding(.horizontal, 16)
                        }
                    }

                    // Stats
                    HStack(spacing: 12) {
                        CardStatItem(title: "Views", value: "142", icon: "eye.fill", color: .axtBlue)
                        CardStatItem(title: "Shares", value: "38", icon: "square.and.arrow.up.fill", color: .axtPurple)
                        CardStatItem(title: "Saves", value: "27", icon: "bookmark.fill", color: .axtGreen)
                    }
                    .padding(.horizontal, 16)

                    // Card Styles
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Card Style")
                            .font(.headline)
                            .foregroundColor(.axtTextPrimary)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(DigitalCard.CardStyle.allCases, id: \.self) { style in
                                    CardStyleChip(style: style)
                                }
                            }
                            .padding(.horizontal, 16)
                        }
                    }

                    // Color Themes
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Color Theme")
                            .font(.headline)
                            .foregroundColor(.axtTextPrimary)
                            .padding(.horizontal, 16)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(DigitalCard.CardColorScheme.allCases, id: \.self) { scheme in
                                    ColorThemeChip(scheme: scheme)
                                }
                            }
                            .padding(.horizontal, 16)
                        }
                    }

                    // Share Options
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Share Your Card")
                            .font(.headline)
                            .foregroundColor(.axtTextPrimary)
                            .padding(.horizontal, 16)
                        VStack(spacing: 10) {
                            ShareOptionRow(icon: "qrcode", title: "QR Code", subtitle: "Let others scan to save", color: .axtBlue)
                            ShareOptionRow(icon: "link", title: "Share Link", subtitle: "Send via any app", color: .axtPurple)
                            ShareOptionRow(icon: "wave.3.forward", title: "NFC Tap", subtitle: "Contactless card exchange", color: .axtGreen)
                            ShareOptionRow(icon: "envelope.fill", title: "Email Card", subtitle: "Send as email attachment", color: .axtOrange)
                        }
                        .padding(.horizontal, 16)
                    }

                    Spacer(minLength: 80)
                }
                .padding(.top, 20)
            }
            .background(Color.axtBackground.ignoresSafeArea())
            .navigationTitle("Digital Card")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showCreateCard = true }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 22))
                            .foregroundColor(.axtBlue)
                    }
                }
            }
        }
        .sheet(isPresented: $showCreateCard) {
            CreateDigitalCardView()
        }
    }
}

struct DigitalCardPreview: View {
    let card: DigitalCard

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            LinearGradient(
                colors: card.colorScheme.gradient,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .frame(height: 190)
            .cornerRadius(20)

            // Card pattern
            ZStack {
                Circle()
                    .fill(Color.white.opacity(0.05))
                    .frame(width: 200, height: 200)
                    .offset(x: 120, y: -40)
                Circle()
                    .fill(Color.white.opacity(0.03))
                    .frame(width: 140, height: 140)
                    .offset(x: 160, y: 40)
            }

            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    // Logo Area
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white.opacity(0.15))
                            .frame(width: 40, height: 40)
                        AXTCOMLogo(size: 24, isDark: false)
                    }
                    Spacer()
                    Image(systemName: "wifi")
                        .font(.system(size: 18))
                        .foregroundColor(.white.opacity(0.6))
                        .rotationEffect(.degrees(90))
                }

                Spacer()

                Text(card.ownerName)
                    .font(.title3.bold())
                    .foregroundColor(.white)
                Text(card.jobTitle)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
                Text(card.company)
                    .font(.caption.bold())
                    .foregroundColor(.white.opacity(0.6))
                    .padding(.top, 2)
                HStack(spacing: 16) {
                    Label(card.email, systemImage: "envelope.fill")
                        .font(.system(size: 11))
                        .foregroundColor(.white.opacity(0.7))
                        .lineLimit(1)
                }
            }
            .padding(20)
        }
        .shadow(color: Color.black.opacity(0.15), radius: 16, y: 6)
    }
}

struct CardStatItem: View {
    let title: String
    let value: String
    let icon: String
    let color: Color

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .font(.system(size: 18))
                .foregroundColor(color)
            VStack(alignment: .leading, spacing: 1) {
                Text(value)
                    .font(.headline.bold())
                    .foregroundColor(.axtTextPrimary)
                Text(title)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(14)
        .background(Color.white)
        .cornerRadius(14)
        .shadow(color: Color.black.opacity(0.04), radius: 6, y: 2)
    }
}

struct CardStyleChip: View {
    let style: DigitalCard.CardStyle

    var icon: String {
        switch style {
        case .gloss: return "sparkles"
        case .matte: return "rectangle.fill"
        case .bamboo: return "leaf.fill"
        case .metal: return "wrench.and.screwdriver.fill"
        }
    }

    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: icon)
                .font(.system(size: 22))
                .foregroundColor(.axtBlue)
                .frame(width: 52, height: 52)
                .background(Color.axtBlue.opacity(0.08))
                .cornerRadius(14)
            Text(style.rawValue)
                .font(.caption.bold())
                .foregroundColor(.axtTextPrimary)
        }
        .padding(.horizontal, 4)
    }
}

struct ColorThemeChip: View {
    let scheme: DigitalCard.CardColorScheme

    var body: some View {
        VStack(spacing: 6) {
            LinearGradient(colors: scheme.gradient, startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 52, height: 36)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.axtGray, lineWidth: 1))
            Text(scheme.rawValue)
                .font(.caption)
                .foregroundColor(.axtTextPrimary)
        }
    }
}

struct ShareOptionRow: View {
    let icon: String
    let title: String
    let subtitle: String
    let color: Color

    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: icon)
                .font(.system(size: 18))
                .foregroundColor(color)
                .frame(width: 40, height: 40)
                .background(color.opacity(0.1))
                .cornerRadius(10)

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subheadline.bold())
                    .foregroundColor(.axtTextPrimary)
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(14)
        .background(Color.white)
        .cornerRadius(14)
        .shadow(color: Color.black.opacity(0.04), radius: 4, y: 2)
    }
}
