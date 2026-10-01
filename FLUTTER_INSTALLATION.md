# Flutter Installation & Setup Guide for macOS

## Prerequisites for macOS

- macOS 11 or later
- 2.5 GB of disk space (IDE + SDK)
- Xcode 12 or later (for iOS development)
- Android Studio (for Android development)
- Git

## Step 1: Install Flutter SDK

### Option A: Using Homebrew (Recommended for macOS)

```bash
# Install Homebrew if not already installed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Flutter
brew install flutter

# Verify installation
flutter --version
```

### Option B: Manual Installation

```bash
# Create development directory
mkdir -p ~/development

# Download Flutter
cd ~/development
git clone https://github.com/flutter/flutter.git -b stable

# Add Flutter to PATH
export PATH="$PATH:~/development/flutter/bin"

# Add to .zshrc or .bash_profile for permanent PATH setup
echo 'export PATH="$PATH:$HOME/development/flutter/bin"' >> ~/.zshrc
source ~/.zshrc

# Verify installation
flutter --version
```

## Step 2: Install Xcode (for iOS)

```bash
# Install Xcode Command Line Tools
xcode-select --install

# Or install full Xcode from App Store
# Then accept license
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch
```

## Step 3: Install CocoaPods (for iOS dependencies)

```bash
# Install CocoaPods
sudo gem install cocoapods

# Verify installation
pod --version
```

## Step 4: Install Android Studio (Optional, but recommended)

1. Download from [Android Studio](https://developer.android.com/studio)
2. Install and follow setup wizard
3. Install Android SDK (API level 21+)
4. Create an Android Virtual Device (AVD)

## Step 5: Verify Flutter Installation

```bash
# Run Flutter doctor to check setup
flutter doctor

# You should see output like:
# Doctor summary (to see all details, run flutter doctor -v):
# [✓] Flutter (Channel stable, 3.x.x, on macOS (native), locale en-US)
# [✓] Android toolchain - develop for Android devices
# [✓] Xcode - develop for iOS and macOS
# [✗] Chrome - develop for the web
# [✓] Android Studio
```

## Step 6: Accept Licenses

```bash
# Accept Android licenses
flutter doctor --android-licenses

# Type 'y' and press Enter for each license
```

## Step 7: Create & Run the Project

```bash
# Navigate to project directory
cd /Users/deepakrajput/projects/study-notes

# Get Flutter dependencies
flutter pub get

# Generate code
flutter pub run build_runner build --delete-conflicting-outputs

# List available devices
flutter devices

# Run on iOS Simulator
flutter run -t lib/main.dart

# Or run on Android Emulator
flutter run -d emulator-5554 -t lib/main.dart
```

## Setting Up iOS Simulator

### Start iOS Simulator

```bash
# List available simulators
xcrun xctrace list devices

# Start specific simulator
open -a Simulator

# Or start from command line
xcrun simctl boot "iPhone 14"
```

### CocoaPods Setup for iOS

```bash
cd ios
pod install
cd ..
```

## Setting Up Android Emulator

### Create Android Virtual Device (AVD)

```bash
# List available AVDs
$ANDROID_HOME/tools/bin/avdmanager list avd

# Create new AVD
$ANDROID_HOME/tools/bin/avdmanager create avd -n Pixel_4_API_30 -k "system-images;android-30;google_apis;x86_64"

# Start emulator
$ANDROID_HOME/emulator/emulator -avd Pixel_4_API_30 &
```

## Running the App

### First Time Setup

```bash
cd /Users/deepakrajput/projects/study-notes

# Clean previous builds
flutter clean

# Get dependencies
flutter pub get

# Generate code
flutter pub run build_runner build --delete-conflicting-outputs

# Run on device/emulator
flutter run -t lib/main.dart
```

### Subsequent Runs

```bash
# Quick run
flutter run

# Run with verbosity
flutter run -v

# Run in profile mode (better performance)
flutter run --profile

# Run in release mode
flutter run --release
```

## IDE Setup

### VS Code

1. Install Flutter extension: `Flutter`
2. Install Dart extension: `Dart`
3. Install EditorConfig extension: `EditorConfig`

### Android Studio

1. Install Flutter plugin: Preferences → Plugins → Flutter
2. Install Dart plugin: Preferences → Plugins → Dart
3. Restart Android Studio

## Troubleshooting

### Flutter not found after installation

```bash
# Check if in PATH
echo $PATH

# Add to .zshrc if needed
nano ~/.zshrc

# Add this line:
export PATH="$PATH:$HOME/development/flutter/bin"

# Save and reload
source ~/.zshrc

# Verify
flutter --version
```

### iOS build fails

```bash
# Clean everything
flutter clean
rm -rf ios/Pods
rm -rf ios/Podfile.lock

# Reinstall pods
cd ios
pod install --repo-update
cd ..

# Try again
flutter run
```

### Android build fails

```bash
# Accept all licenses
flutter doctor --android-licenses

# Clean build
flutter clean
flutter pub get

# Try again
flutter run
```

### CocoaPods error

```bash
# Update CocoaPods repo
pod repo update

# Clear pod cache
rm -rf ~/Library/Developer/Xcode/DerivedData/*

# Try again
cd ios && pod install && cd ..
```

### Pub get timeout

```bash
# Increase timeout
flutter pub get --verbose

# Or manually upgrade packages
flutter pub upgrade
```

## Useful Commands

```bash
# Check environment
flutter doctor -v

# List devices
flutter devices

# Upgrade Flutter
flutter upgrade

# Switch channel
flutter channel stable  # or 'dev', 'master'

# Format code
flutter format lib/

# Analyze code
flutter analyze

# Build APK
flutter build apk --release

# Build AAB (for Play Store)
flutter build appbundle --release

# Build iOS
flutter build ios --release

# Build Web
flutter build web --release

# Build macOS
flutter build macos --release

# Build Windows
flutter build windows --release
```

## Next Steps

After Flutter is installed and verified:

1. Navigate to project: `cd /Users/deepakrajput/projects/study-notes`
2. Read [QUICK_START.md](QUICK_START.md) for quick setup
3. Run `flutter run` to start the app
4. Follow [PROJECT_PLAN.md](PROJECT_PLAN.md) for development roadmap

## Resources

- [Flutter Installation Guide](https://flutter.dev/docs/get-started/install/macos)
- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Documentation](https://dart.dev/guides)
- [GitHub Issues](https://github.com/flutter/flutter/issues)

---

**Have issues?** Run `flutter doctor` and share the output for diagnosis.
