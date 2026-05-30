import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var appState: AppState
    @State private var showScanner = false

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $appState.selectedTab) {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                    .tag(0)

                ContactsView()
                    .tabItem {
                        Label("Contacts", systemImage: "person.2.fill")
                    }
                    .tag(1)

                // Scanner tab placeholder (launches sheet)
                Color.clear
                    .tabItem {
                        Label("Scan", systemImage: "viewfinder")
                    }
                    .tag(2)

                DigitalCardListView()
                    .tabItem {
                        Label("Cards", systemImage: "creditcard.fill")
                    }
                    .tag(3)

                SettingsView()
                    .tabItem {
                        Label("More", systemImage: "ellipsis.circle.fill")
                    }
                    .tag(4)
            }
            .accentColor(.axtBlue)
            .onChange(of: appState.selectedTab) { tab in
                if tab == 2 {
                    showScanner = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        appState.selectedTab = 1
                    }
                }
            }

            // Floating scan button
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: { showScanner = true }) {
                        ZStack {
                            Circle()
                                .fill(LinearGradient.axtBrand)
                                .frame(width: 60, height: 60)
                                .shadow(color: Color.axtBlue.opacity(0.4), radius: 12, x: 0, y: 4)
                            Image(systemName: "viewfinder")
                                .font(.system(size: 24, weight: .semibold))
                                .foregroundColor(.white)
                        }
                    }
                    Spacer()
                }
                .padding(.bottom, 12)
            }
            .ignoresSafeArea(edges: .bottom)
            .allowsHitTesting(true)
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .sheet(isPresented: $showScanner) {
            CardScannerView()
        }
    }
}
