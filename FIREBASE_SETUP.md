# Firebase Configuration Guide

This document contains instructions for setting up Firebase for the Notes Marketplace app.

## Prerequisites

- Firebase Project created on [Firebase Console](https://console.firebase.google.com)
- Flutter SDK installed
- Android Studio / Xcode installed
- Firebase CLI installed

## Step 1: Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com)
2. Click "Add Project"
3. Enter project name: `notes-marketplace-prod`
4. Enable Google Analytics
5. Click "Create Project"

## Step 2: Register Android App

1. In Firebase Console, click "Add app" → Android
2. Enter Android Package Name: `com.notesmarketplace.app`
3. SHA-1 Certificate: [Get from Android Studio or command line]
4. Click "Register app"
5. Download `google-services.json`
6. Place in: `android/app/google-services.json`

### Get SHA-1 Certificate:

```bash
# Windows
cd android
./gradlew signingReport

# macOS/Linux
cd android
./gradlew signingReport
```

## Step 3: Register iOS App

1. In Firebase Console, click "Add app" → iOS
2. Enter iOS Bundle ID: `com.notesmarketplace.app`
3. Download `GoogleService-Info.plist`
4. Open Xcode project: `ios/Runner.xcworkspace`
5. Drag `GoogleService-Info.plist` into Xcode
6. Make sure it's added to all targets

## Step 4: Enable Firebase Services

### Authentication
1. In Firebase Console → Authentication
2. Go to "Sign-in method"
3. Enable:
   - Email/Password
   - Google
   - Phone Number

### Firestore Database
1. In Firebase Console → Firestore Database
2. Click "Create Database"
3. Select production mode
4. Choose region: `asia-south1` (India)
5. Click "Enable"

### Firebase Storage
1. In Firebase Console → Storage
2. Click "Get started"
3. Accept default rules
4. Click "Done"

### Cloud Messaging (FCM)
1. In Firebase Console → Cloud Messaging
2. View is automatically available
3. Note down the Server Key for backend

## Step 5: Configure Flutter App

Update `lib/main.dart`:

```dart
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const ProviderScope(child: MyApp()));
}
```

## Step 6: Install Dependencies

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

## Step 7: Test Configuration

Run on Android:
```bash
flutter run -t lib/main.dart
```

Run on iOS:
```bash
flutter run -t lib/main.dart
```

## Step 8: Firestore Security Rules

Deploy security rules from `firebase/firestore.rules`:

```bash
firebase deploy --only firestore:rules
```

## Step 9: Enable Additional Services

### Analytics
- Automatically enabled when Firebase is initialized

### Performance Monitoring
1. In Firebase Console → Performance
2. Automatically enabled

### Crashlytics
1. In Firebase Console → Crashlytics
2. Follow instructions to integrate

## Environment Variables

Create `.env` file in project root:

```
FIREBASE_PROJECT_ID=notes-marketplace-prod
FIREBASE_WEB_API_KEY=your-web-api-key
RAZORPAY_KEY_ID=your-razorpay-key-id
RAZORPAY_KEY_SECRET=your-razorpay-secret
```

## Testing Firebase Connection

1. Add test document to Firestore
2. Run app and verify it can read the document
3. Verify authentication flows work

## Common Issues

### "App not configured" Error
- Ensure `google-services.json` is in `android/app/`
- Ensure `GoogleService-Info.plist` is added to Xcode

### "Permission denied" Error
- Check Firestore security rules
- Verify user is authenticated
- Check user has read/write permissions

### Firebase Emulator Setup (Optional)

```bash
# Install Firebase Emulator Suite
npm install -g firebase-tools

# Start emulator
firebase emulators:start

# Connect app to emulator (in main.dart)
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

if (kDebugMode) {
  FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
}
```

## Next Steps

1. Configure Razorpay payment gateway
2. Set up admin panel backend
3. Deploy Firebase functions for backend logic
4. Configure email templates for authentication

---

For more details, refer to:
- [Firebase Flutter Plugin Documentation](https://firebase.flutter.dev)
- [Firestore Documentation](https://firebase.google.com/docs/firestore)
- [Firebase Authentication](https://firebase.google.com/docs/auth)
