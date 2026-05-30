import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var appState: AppState
    @State private var currentPage = 0
    @State private var showSignup = false

    let pages: [OnboardingPage] = [
        OnboardingPage(icon: "viewfinder.circle.fill", title: "Scan Any Business Card", description: "Instantly capture paper cards, digital cards, LinkedIn QR codes, and event badges in 60+ languages.", color: .axtBlue),
        OnboardingPage(icon: "brain.head.profile", title: "AI-Powered Intelligence", description: "Our AI enriches your leads, qualifies prospects, and suggests the perfect follow-up — automatically.", color: .axtPurple),
        OnboardingPage(icon: "person.2.circle.fill", title: "Collaborate With Your Team", description: "Share contacts across your team, set roles, and sync leads to Salesforce, HubSpot and more.", color: .axtGreen),
        OnboardingPage(icon: "creditcard.circle.fill", title: "Your Digital Business Card", description: "Create a stunning digital card and share it instantly — contactless, modern, always up to date.", color: .axtOrange)
    ]

    var body: some View {
        ZStack {
            Color.axtBackground.ignoresSafeArea()

            VStack(spacing: 0) {
                // Logo
                VStack(spacing: 8) {
                    AXTCOMLogo(size: 72)
                    Text("AXTCOM")
                        .font(.system(size: 32, weight: .black, design: .rounded))
                        .foregroundColor(.axtTextPrimary)
                    Text("Smart Contact Intelligence")
                        .font(.subheadline)
                        .foregroundColor(.axtTextSecondary)
                }
                .padding(.top, 60)
                .padding(.bottom, 40)

                // Page tabs
                TabView(selection: $currentPage) {
                    ForEach(Array(pages.enumerated()), id: \.offset) { index, page in
                        OnboardingPageView(page: page)
                            .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(height: 320)

                // Page indicators
                HStack(spacing: 8) {
                    ForEach(0..<pages.count, id: \.self) { i in
                        Capsule()
                            .fill(i == currentPage ? Color.axtBlue : Color.axtGray)
                            .frame(width: i == currentPage ? 24 : 8, height: 8)
                            .animation(.spring(), value: currentPage)
                    }
                }
                .padding(.top, 24)

                Spacer()

                // CTA Buttons
                VStack(spacing: 12) {
                    Button(action: { showSignup = true }) {
                        HStack {
                            Text("Get Started Free")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(LinearGradient.axtBrand)
                        .cornerRadius(16)
                        .shadow(color: Color.axtBlue.opacity(0.35), radius: 12, y: 4)
                    }

                    Button(action: { showSignup = true }) {
                        Text("Sign In")
                            .font(.subheadline.bold())
                            .foregroundColor(.axtBlue)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 40)
            }
        }
        .sheet(isPresented: $showSignup) {
            SignupView()
        }
    }
}

struct OnboardingPage {
    let icon: String
    let title: String
    let description: String
    let color: Color
}

struct OnboardingPageView: View {
    let page: OnboardingPage

    var body: some View {
        VStack(spacing: 20) {
            ZStack {
                Circle()
                    .fill(page.color.opacity(0.12))
                    .frame(width: 120, height: 120)
                Image(systemName: page.icon)
                    .font(.system(size: 52, weight: .light))
                    .foregroundStyle(
                        LinearGradient(colors: [page.color, page.color.opacity(0.6)], startPoint: .top, endPoint: .bottom)
                    )
            }

            Text(page.title)
                .font(.title2.bold())
                .foregroundColor(.axtTextPrimary)
                .multilineTextAlignment(.center)

            Text(page.description)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
        }
        .padding(.horizontal, 16)
    }
}
