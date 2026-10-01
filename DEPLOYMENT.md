# Study Notes App - Deployment Guide

This guide covers the necessary steps to deploy the Study Notes cross-platform application to production.

## 1. Prerequisites
- Flutter SDK (stable channel) installed
- Firebase CLI installed and authenticated
- Apple Developer Account (for iOS/macOS)
- Google Play Developer Account (for Android)

## 2. Environment Setup
Create a `.env.production` file containing:
```
API_URL=https://api.studynotes.com
FIREBASE_PROJECT_ID=study-notes-prod
RAZORPAY_KEY=rzp_live_xxxxxxxx
```

## 3. Building for Web (Production)
```bash
flutter build web --release --dart-define=ENVIRONMENT=production
```
*Host the resulting `build/web` directory on Firebase Hosting or Vercel.*

## 4. Building for Android (APK / App Bundle)
```bash
# Build APK
flutter build apk --release

# Build App Bundle (for Play Store)
flutter build appbundle --release
```

## 5. Building for iOS
```bash
flutter build ipa --release
```
*Open the resulting workspace in Xcode to upload to TestFlight or the App Store.*

## 6. Building for Desktop (macOS & Windows)
```bash
# macOS
flutter build macos --release

# Windows
flutter build windows --release
```

## 7. CI/CD Pipeline (GitHub Actions)
A standard CI/CD pipeline should be configured to run tests and build artifacts on every push to the `main` branch. See `.github/workflows/main.yml` for configuration.

## 8. Security & Rate Limiting
- Ensure `firestore.rules` is deployed to the production Firebase project.
- Rate limiting should be enforced on the API Gateway level (e.g. Firebase App Check) to prevent abuse of endpoints.
