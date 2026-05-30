import SwiftUI

struct SignupView: View {
    @EnvironmentObject var appState: AppState
    @Environment(\.dismiss) var dismiss
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var company = ""
    @State private var jobTitle = ""
    @State private var phone = ""
    @State private var isLoading = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // Header
                    VStack(spacing: 8) {
                        AXTCOMLogo(size: 52)
                        Text("Create Your Account")
                            .font(.title2.bold())
                            .foregroundColor(.axtTextPrimary)
                        Text("Start scanning smarter with AXTCOM")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.top, 24)

                    // Form
                    VStack(spacing: 16) {
                        HStack(spacing: 12) {
                            AXTTextField(placeholder: "First Name", text: $firstName, icon: "person")
                            AXTTextField(placeholder: "Last Name", text: $lastName, icon: "person")
                        }
                        AXTTextField(placeholder: "Email", text: $email, icon: "envelope", keyboardType: .emailAddress)
                        AXTTextField(placeholder: "Company", text: $company, icon: "building.2")
                        AXTTextField(placeholder: "Job Title", text: $jobTitle, icon: "briefcase")
                        AXTTextField(placeholder: "Phone", text: $phone, icon: "phone", keyboardType: .phonePad)
                    }
                    .padding(.horizontal, 24)

                    // Sign Up Button
                    Button(action: signUp) {
                        ZStack {
                            if isLoading {
                                ProgressView().tint(.white)
                            } else {
                                Text("Create Account")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(LinearGradient.axtBrand)
                        .cornerRadius(16)
                        .shadow(color: Color.axtBlue.opacity(0.35), radius: 12, y: 4)
                    }
                    .disabled(firstName.isEmpty || email.isEmpty || isLoading)
                    .padding(.horizontal, 24)

                    // Terms
                    Text("By signing up, you agree to AXTCOM's Terms of Service and Privacy Policy")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 32)

                    Spacer(minLength: 40)
                }
            }
            .background(Color.axtBackground.ignoresSafeArea())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") { dismiss() }
                        .foregroundColor(.axtBlue)
                }
            }
        }
    }

    private func signUp() {
        guard !firstName.isEmpty, !email.isEmpty else { return }
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            isLoading = false
            let user = UserProfile(
                firstName: firstName,
                lastName: lastName,
                email: email,
                company: company,
                jobTitle: jobTitle,
                phone: phone
            )
            appState.completeOnboarding(user: user)
            dismiss()
        }
    }
}

struct AXTTextField: View {
    let placeholder: String
    @Binding var text: String
    let icon: String
    var keyboardType: UIKeyboardType = .default

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 16))
                .foregroundColor(.axtTextSecondary)
                .frame(width: 20)
            TextField(placeholder, text: $text)
                .font(.body)
                .keyboardType(keyboardType)
                .autocapitalization(keyboardType == .emailAddress ? .none : .words)
        }
        .padding(.horizontal, 16)
        .frame(height: 52)
        .background(Color.white)
        .cornerRadius(12)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.axtGray, lineWidth: 1))
    }
}
