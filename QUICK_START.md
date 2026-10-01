# Quick Start Guide

Get the Notes Marketplace app up and running in 15 minutes!

## Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.0+)
- [Dart SDK](https://dart.dev/get-dart) (3.0+)
- [Git](https://git-scm.com/)
- Code editor (VS Code or Android Studio)

## 1. Clone & Setup (5 minutes)

```bash
# Navigate to the project
cd /Users/deepakrajput/projects/study-notes

# Get Flutter dependencies
flutter pub get

# Generate code for Riverpod and models
flutter pub run build_runner build --delete-conflicting-outputs
```

## 2. Firebase Setup (Optional - for full features) (5 minutes)

For now, the app runs without Firebase in development mode. To enable Firebase:

1. Create a Firebase project at [console.firebase.google.com](https://console.firebase.google.com)
2. Follow [FIREBASE_SETUP.md](FIREBASE_SETUP.md)
3. Update `lib/main.dart` to initialize Firebase

## 3. Run the App (5 minutes)

### On Android Emulator
```bash
# Start Android emulator first, then:
flutter run -t lib/main.dart
```

### On iOS Simulator
```bash
# Start iOS simulator, then:
flutter run -t lib/main.dart
```

### On Physical Device
```bash
# Connect device and enable USB debugging
flutter run -t lib/main.dart
```

### On Web (Chrome)
```bash
flutter run -d chrome -t lib/main.dart
```

## 4. Testing the App

### Login Screen
- The splash screen will automatically navigate to the login/home screen
- Current screens are in development mode

### UI Components
- Material Design 3 components are implemented
- Custom widgets in `lib/common/widgets/`

### Theme
- Light and dark themes configured
- To toggle, update `ThemeMode` in `main.dart`

## Project Structure Overview

```
study-notes/
├── lib/
│   ├── main.dart                 # Entry point
│   ├── core/                     # Theme, constants, extensions
│   ├── features/                 # Feature modules
│   ├── common/widgets/           # Reusable components
│   ├── models/                   # Data models
│   ├── providers/                # State management
│   ├── routes/                   # App routing
│   └── services/                 # Business logic (TODO)
├── pubspec.yaml                  # Dependencies
├── PROJECT_PLAN.md               # Development roadmap
├── IMPLEMENTATION_GUIDE.md       # Detailed implementation steps
├── DATABASE_SCHEMA.md            # Firestore schema
└── FIREBASE_SETUP.md             # Firebase configuration
```

## Available Commands

```bash
# Format code
flutter format lib/

# Analyze code
flutter analyze

# Run tests
flutter test

# Build APK (Android)
flutter build apk --release

# Build IPA (iOS)
flutter build ios --release

# Build Web
flutter build web --release

# Generate code
flutter pub run build_runner build
```

## Key Features Implemented (Phase 1)

✅ Project structure with Clean Architecture  
✅ Material Design 3 theme system  
✅ Light and dark modes  
✅ All data models defined  
✅ Riverpod state management setup  
✅ Common UI widgets  
✅ Basic screens (Splash, Login, Home)  
✅ Navigation routing setup  
✅ Firestore database schema  

## Next Steps

1. **Configure Firebase** (FIREBASE_SETUP.md)
2. **Build Authentication** (IMPLEMENTATION_GUIDE.md → Phase 2)
3. **Create Onboarding Flow** (IMPLEMENTATION_GUIDE.md → Phase 3)
4. **Implement Home Screen** (IMPLEMENTATION_GUIDE.md → Phase 4)

## Troubleshooting

### `flutter pub get` fails
```bash
# Clear pub cache
flutter clean
rm -rf pubspec.lock
flutter pub get
```

### Build errors
```bash
# Clean build
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### iOS build issues
```bash
cd ios
rm -rf Pods
rm -rf Podfile.lock
cd ..
flutter pub get
```

## Development Tips

1. **Hot Reload**: Press `R` in terminal to hot reload during development
2. **DevTools**: Run `flutter run -d chrome --profile` to access DevTools
3. **Inspector**: Use `flutter run` then press `I` to open Flutter Inspector
4. **Logging**: Use `print()` or `debugPrint()` for debugging

## Documentation Links

- [PROJECT_PLAN.md](PROJECT_PLAN.md) - Full roadmap and phases
- [IMPLEMENTATION_GUIDE.md](IMPLEMENTATION_GUIDE.md) - Detailed implementation steps
- [DATABASE_SCHEMA.md](DATABASE_SCHEMA.md) - Firestore schema documentation
- [FIREBASE_SETUP.md](FIREBASE_SETUP.md) - Firebase configuration guide
- [Flutter Documentation](https://flutter.dev/docs)
- [Riverpod Documentation](https://riverpod.dev)

## Support

For issues or questions:
1. Check the documentation files above
2. Review the code comments in `lib/`
3. Check Flutter/Dart error messages
4. Refer to package documentation

---

**Ready to develop?** Start with `flutter run` and begin implementing features!

**First time?** Read [IMPLEMENTATION_GUIDE.md](IMPLEMENTATION_GUIDE.md) to understand the next phases.
