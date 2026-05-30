# AXTCOM – Smart Contact Intelligence

> iOS app inspired by Covve — business card scanning, digital cards, AI lead enrichment, team collaboration and CRM sync.

## Features

| Feature | Details |
|---------|---------|
| 📸 Card Scanner | Camera scan, QR Code, LinkedIn, Badge, Voice (60+ languages) |
| 🤖 AI Intelligence | Lead scoring 0-100, auto enrichment, personalised follow-up suggestions |
| 👥 Team Collaboration | Admin / Member / Viewer roles, shared contact pool, activity feed |
| 💳 Digital Business Card | QR share, NFC tap, link share, 6 colour themes × 4 styles |
| 📊 CRM Pipeline | Salesforce, HubSpot, Pipedrive, Zoho – one-tap sync |
| 🔐 Security | ISO 27001 badge, GDPR, E2E encryption, 2FA ready |
| 🔔 Follow-up Reminders | AI-driven nudges when a contact goes cold |

## Structure

```
AXTCOM/
├── AXTCOM.xcodeproj/
└── AXTCOM/
    ├── App/
    │   ├── AXTCOMApp.swift        # @main entry point
    │   └── AppState.swift         # Global ObservableObject
    ├── Models/
    │   ├── Contact.swift
    │   ├── DigitalCard.swift
    │   └── TeamMember.swift
    ├── Views/
    │   ├── AXTCOMLogo.swift       # Programmatic vector logo + App Icon
    │   ├── ContentView.swift
    │   ├── MainTabView.swift
    │   ├── Home/
    │   │   ├── OnboardingView.swift
    │   │   ├── SignupView.swift
    │   │   ├── HomeView.swift
    │   │   └── SecurityView.swift
    │   ├── Contacts/
    │   │   ├── ContactsView.swift
    │   │   ├── ContactDetailView.swift
    │   │   └── AddContactView.swift
    │   ├── Scanner/
    │   │   └── CardScannerView.swift
    │   ├── DigitalCard/
    │   │   ├── DigitalCardListView.swift
    │   │   └── DigitalCardDetailView.swift
    │   ├── CRM/
    │   │   └── CRMDashboardView.swift
    │   ├── Team/
    │   │   └── TeamCollaborationView.swift
    │   └── Settings/
    │       └── SettingsView.swift
    ├── Utils/
    │   └── ColorExtensions.swift  # Brand palette + hex init
    └── Resources/
        ├── Info.plist
        └── Assets.xcassets/
```

## Requirements

- Xcode 15+
- iOS 17+ deployment target
- Swift 5.9+

## Getting Started

1. Clone the repo
2. Open `AXTCOM.xcodeproj` in Xcode
3. Select your team in Signing & Capabilities
4. Run on Simulator (iPhone 15 Pro recommended) or device

## Logo Design

The AXTCOM logo is a **fully programmatic SwiftUI `Canvas`** — no external assets needed.

- Bold geometric "**A**" letterform on a deep-blue gradient disc  
- Cyan accent crossbar suggesting intelligence / connectivity  
- Arc + dot motif top-right = network / contact node  
- Works at any size (24 pt to 1024 pt) and on both light and dark backgrounds  

See `AXTCOMLogo.swift` → `#Preview` for a live size/theme grid.
