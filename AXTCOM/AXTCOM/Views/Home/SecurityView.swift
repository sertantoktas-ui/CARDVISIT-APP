import SwiftUI

struct SecurityView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Badge
                VStack(spacing: 12) {
                    ZStack {
                        Circle()
                            .fill(Color.axtGreen.opacity(0.1))
                            .frame(width: 80, height: 80)
                        Image(systemName: "lock.shield.fill")
                            .font(.system(size: 38))
                            .foregroundColor(.axtGreen)
                    }
                    Text("Security Center")
                        .font(.title2.bold())
                        .foregroundColor(.axtTextPrimary)
                    Text("AXTCOM is certified and audited to the highest enterprise standards.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 32)
                }
                .padding(.top, 24)

                // Certifications
                VStack(alignment: .leading, spacing: 12) {
                    Text("Certifications")
                        .font(.headline)
                        .foregroundColor(.axtTextPrimary)
                        .padding(.horizontal, 16)

                    CertBadgeRow(icon: "checkmark.seal.fill",  title: "ISO 27001",           subtitle: "Information Security Management", color: .axtBlue)
                    CertBadgeRow(icon: "shield.lefthalf.filled", title: "GDPR Compliant",     subtitle: "EU data protection regulation",   color: .axtGreen)
                    CertBadgeRow(icon: "star.shield.fill",     title: "Platinum Cyber Rating", subtitle: "Independent security audit",      color: .axtPurple)
                    CertBadgeRow(icon: "lock.fill",            title: "End-to-End Encryption", subtitle: "Data in transit & at rest",       color: .axtOrange)
                }
                .padding(.horizontal, 16)

                // Data controls
                InfoSection(title: "Your Data Controls") {
                    VStack(spacing: 12) {
                        DataControlRow(icon: "arrow.down.circle.fill", title: "Export My Data",   subtitle: "Download all your contacts as CSV/vCard")
                        DataControlRow(icon: "trash.fill",             title: "Delete Account",   subtitle: "Permanently remove all data")
                        DataControlRow(icon: "hand.raised.fill",       title: "Data Processing",  subtitle: "Manage consent & processing")
                    }
                }
                .padding(.horizontal, 16)

                Spacer(minLength: 40)
            }
        }
        .background(Color.axtBackground.ignoresSafeArea())
        .navigationTitle("Security")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CertBadgeRow: View {
    let icon: String; let title: String; let subtitle: String; let color: Color

    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(color)
                .frame(width: 44, height: 44)
                .background(color.opacity(0.1))
                .cornerRadius(12)
            VStack(alignment: .leading, spacing: 2) {
                Text(title).font(.subheadline.bold()).foregroundColor(.axtTextPrimary)
                Text(subtitle).font(.caption).foregroundColor(.secondary)
            }
            Spacer()
            Image(systemName: "checkmark.circle.fill").foregroundColor(.axtGreen)
        }
        .padding(14)
        .background(Color.white)
        .cornerRadius(14)
        .shadow(color: .black.opacity(0.04), radius: 6, y: 2)
    }
}

struct DataControlRow: View {
    let icon: String; let title: String; let subtitle: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon).font(.system(size: 16)).foregroundColor(.axtBlue).frame(width: 20)
            VStack(alignment: .leading, spacing: 1) {
                Text(title).font(.subheadline.bold()).foregroundColor(.axtTextPrimary)
                Text(subtitle).font(.caption).foregroundColor(.secondary)
            }
            Spacer()
            Image(systemName: "chevron.right").font(.caption).foregroundColor(.secondary)
        }
        .padding(.vertical, 4)
    }
}
