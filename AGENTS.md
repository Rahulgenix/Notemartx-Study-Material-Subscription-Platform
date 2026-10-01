# AGENTS.md - Notemartx System Rules & Architecture

This document serves as the permanent reference for all AI agents working on the Notemartx ecosystem. **Do not overwrite, alter, or ignore these rules.**

## 1. PROJECT REPOSITORIES & WORKSPACE CONTEXT
- **Root workspace**: `/Users/rahulrajput/projects/`
- **User Mobile App**: `study-notes` (Flutter Cross-Platform)
- **Admin Panel**: `study_notes_admin` (Flutter Web)

## 2. "LUNA" DESIGN SYSTEM (PERMANENT RULE)
**DESIGN SYSTEM RULE**: The official color palette of this project is strictly the 'LUNA' theme. **Never alter, replace, or reset these color constants or ThemeData in future tasks.**
- Highlight Accent: `#A7EBF2` (0xFFA7EBF2)
- Secondary Teal: `#54ACBF` (0xFF54ACBF)
- Primary Mid-Blue: `#26658C` (0xFF26658C)
- Deep Navy Surface: `#023859` (0xFF023859)
- Midnight Deep BG: `#011C40` (0xFF011C40)

## 3. AUTHENTICATION & ONBOARDING ARCHITECTURE
- **Two-step lightweight onboarding**:
  - Screen 1: User Full Name + Phone Number (+91 validation) with "Get OTP" & "Continue with Google" option.
  - Screen 2: 6-digit SMS OTP verification via `FirebaseAuth.instance.verifyPhoneNumber`.
  - Firestore sync: Upon verification, profile persists to `users/{uid}` with `fullName`, `phoneNumber`, `email`, and timestamps.
- **User Management Table**: Real-time stream from `users` collection displaying Name, Email, Phone, Provider badge, Joined Date, and Status toggle.

## 4. HTML NOTE VIEWER PIPELINE
- Transitioned from static PDFs to interactive, styled HTML/CSS study notes.
- **Cross-Platform Rendering Engine** (`html_note_viewer_screen.dart`):
  - Flutter Web: Native HTML `<iframe>` through `dart:ui_web.platformViewRegistry` and `HtmlElementView` to support `@import` Google web fonts, custom CSS, borders, and inline SVG diagrams.
  - Mobile (Android/iOS): In-App `WebViewWidget` with `JavaScriptMode.unrestricted`.
- **Direct Navigation**: Tapping any subject card in Category/Home opens the note viewer directly without intermediate screens. AppBar title renders clean subject name.

## 5. ACADEMIC & 'OTHER' CATEGORY PRICING
- Notes Management (`/#/notes`) synchronizes specifically with the 'Other' category subjects (`userCategory == 'others'` / `category == 'Others'`).
- **Pricing controls**: Toggle between "Free" and "Paid" (with custom ₹ amount input) and User Visibility switch ("Active" vs "Hidden").

## 6. MONETIZATION & REMOTE ADS CONTROLLER
- Google AdMob SDK integration (`google_mobile_ads`).
- **Production IDs**:
  - App ID: `ca-app-pub-2136323943406256~2129720295`
  - Banner Unit ID: `ca-app-pub-2136323943406256/8311985261`
  - Interstitial Unit ID: `ca-app-pub-2136323943406256/4621624443`
- **Remote Config Controller**: `app_settings/ads_config` in Firestore with switches to enable/disable ads remotely via Admin Panel without app rebuilds.

## 7. SUPPORT & COMPLIANCE
- Help & Support: `mailto:notemartx@gmail.com` with Android 11+ `<queries>` configuration.
- Production-ready `PrivacyPolicyScreen` compliant with Google Play Store guidelines.
