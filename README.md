# Premium Educational Notes Marketplace - Flutter App

A production-ready cross-platform Flutter application for a premium educational notes marketplace. The app is designed for students (Class 10, 12, Polytechnic, and B.Tech) to browse, purchase, and access high-quality interactive study materials.

## 🎯 Features

### 📱 User Features
- **Secure Authentication**: Email/Password, Google OAuth, Mobile OTP login
- **User Onboarding**: Course, Branch, and Semester selection
- **Notes Marketplace**: Browse and purchase individual notes
- **Premium Subscriptions**: Monthly, Quarterly, and Yearly plans with discounts
- **My Notes Section**: View purchased notes, favorites, and offline access
- **Advanced Search**: Global search with filters and suggestions
- **Infinite Canvas Viewer**: Interactive JSON-based dynamic scaling viewer
- **User Profile**: Manage account, view purchase history, subscription status
- **Push Notifications**: New notes, offers, subscription reminders
- **Dark Mode**: Full dark mode support

### 🏢 Admin Features
- **Content Management**: Create, edit, delete, and manage Infinite Canvas notes
- **Academic Structure**: Manage courses, branches, semesters, and subjects
- **Pricing Management**: Set prices, configure discounts, manage subscription plans
- **User Management**: View users, purchases, and manage access
- **Analytics Dashboard**: Revenue, top-selling notes, most-viewed subjects

### 🔐 Security Features
- **Encrypted Local Storage**: Offline notes stored encrypted
- **Secure Payments**: Razorpay payment gateway integration

## 🛠️ Technology Stack

### Frontend
- **Framework**: Flutter 3.0+
- **State Management**: Riverpod
- **Navigation**: GoRouter
- **UI**: Material Design 3

### Backend
- **Authentication**: Firebase Auth
- **Database**: Cloud Firestore
- **Storage**: Firebase Storage
- **Messaging**: Firebase Cloud Messaging (FCM)
- **Analytics**: Firebase Analytics

### Payments
- **Payment Gateway**: Razorpay

### Local Storage
- **Hive**: Encrypted local storage
- **SharedPreferences**: Key-value storage
- **SQLite**: Data persistence

### Other
- **Networking**: Dio
- **Logging**: Logger
- **Encryption**: encrypt

## 📁 Project Structure

```
lib/
├── main.dart                 # App entry point
├── core/                     # Core functionality
│   ├── constants/            # App constants and strings
│   ├── theme/                # Theme configuration and design tokens
│   ├── extensions/           # Dart extensions
│   └── utils/                # Utility functions
├── features/                 # Feature modules
│   ├── auth/                 # Authentication
│   ├── onboarding/           # User onboarding
│   ├── home/                 # Home screen
│   ├── marketplace/          # Notes marketplace
│   ├── notes/                # My notes section
│   ├── profile/              # User profile
│   ├── search/               # Search functionality
│   ├── payment/              # Payment integration
│   └── pdf_viewer/           # Obsolete (Will be removed)
├── services/                 # Business logic services
├── repositories/             # Data repositories
├── models/                   # Data models
├── common/                   # Common widgets and utilities
│   └── widgets/              # Reusable UI components
└── providers/                # Riverpod providers
```

## 🚀 Getting Started

### Prerequisites
- Flutter 3.0 or higher
- Dart 3.0 or higher
- Firebase CLI
- Xcode (for iOS development)
- Android Studio (for Android development)

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/notes-marketplace.git
cd notes-marketplace
```

2. **Install dependencies**
```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

3. **Configure Firebase**
- Follow [FIREBASE_SETUP.md](FIREBASE_SETUP.md) for detailed Firebase configuration
- Download `google-services.json` for Android
- Download `GoogleService-Info.plist` for iOS

4. **Add Firebase configuration files**
- Place `google-services.json` in `android/app/`
- Add `GoogleService-Info.plist` to Xcode project

5. **Run the app**
```bash
# Android
flutter run -t lib/main.dart

# iOS
flutter run -t lib/main.dart

# Web
flutter run -d chrome -t lib/main.dart

# Windows
flutter run -d windows -t lib/main.dart

# macOS
flutter run -d macos -t lib/main.dart
```

## 📋 Development Phases

See [PROJECT_PLAN.md](PROJECT_PLAN.md) for detailed development roadmap and [IMPLEMENTATION_GUIDE.md](IMPLEMENTATION_GUIDE.md) for step-by-step implementation instructions.

### Current Status
- ✅ **Phase 1**: Project Setup & Infrastructure (70% complete)
- 🔄 **Phase 2**: Authentication & Firebase Setup (In progress)
- ⏳ **Phase 3-18**: Remaining phases (Not started)

## 📚 Documentation

- **[PROJECT_PLAN.md](PROJECT_PLAN.md)** - Comprehensive project roadmap
- **[IMPLEMENTATION_GUIDE.md](IMPLEMENTATION_GUIDE.md)** - Step-by-step implementation guide
- **[DATABASE_SCHEMA.md](DATABASE_SCHEMA.md)** - Firestore database schema
- **[FIREBASE_SETUP.md](FIREBASE_SETUP.md)** - Firebase configuration guide

## 🎨 Design System

The app uses Material Design 3 with a custom theme system. Color palette and typography are defined in:
- `lib/core/theme/app_theme_constants.dart` - Colors, typography, spacing, shadows
- `lib/core/theme/app_theme.dart` - Light and dark themes

## 🧪 Testing

### Unit Tests
```bash
flutter test
```

### Widget Tests
```bash
flutter test --tags=unit
```

### Integration Tests
```bash
flutter test integration_test/
```

## 📦 Build & Deployment

### Android
```bash
# Debug APK
flutter build apk --debug

# Release APK
flutter build apk --release

# App Bundle for Play Store
flutter build appbundle --release
```

### iOS
```bash
# Debug IPA
flutter build ios --debug

# Release IPA
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

### Windows
```bash
flutter build windows --release
```

### macOS
```bash
flutter build macos --release
```

## 🔐 Security Best Practices

- All API communications use HTTPS
- Firebase Security Rules enforce access control
- Sensitive data encrypted at rest and in transit
- Regular security audits and updates
- Rate limiting on API endpoints
- Input validation and sanitization

## 📝 Code Standards

- Follow Clean Architecture principles
- Use meaningful variable names
- Add comprehensive comments and documentation
- Write testable, modular code
- Use const constructors when possible
- Format code with `flutter format`
- Check with `flutter analyze`

## 🤝 Contributing

1. Create a feature branch: `git checkout -b feature/your-feature`
2. Commit changes: `git commit -am 'Add your feature'`
3. Push to branch: `git push origin feature/your-feature`
4. Submit a Pull Request

## 📄 License

This project is proprietary and confidential.

## 👥 Team

- **Project Lead**: Your Name
- **Flutter Developer**: Your Team

## 📞 Support

For issues, questions, or support, please contact support@notesmarketplace.com

---

**Last Updated**: 2026-07-09  
**Version**: 1.0.0  
**Status**: In Development
