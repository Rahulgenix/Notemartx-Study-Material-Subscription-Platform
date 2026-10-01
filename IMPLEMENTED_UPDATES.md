# Notemartx Premium UI & Universal Search Update

## Implemented

- Unified light and dark themes around the official LUNA education palette.
- Added a prominent universal-search launcher to Home.
- Rebuilt Search with live debounced results across notes, subjects, courses,
  branches, and semesters.
- Added relevance ranking, partial matching, typo tolerance, and education
  abbreviations such as AI, ML, DBMS, DSA, OS, CN, B.Tech, and CSE.
- Added result-type filters, recent searches, suggestions, pull-to-refresh,
  loading states, empty states, and error handling.
- Enforced free pricing for School and College search results.
- Prevented paid `Other` notes from bypassing checkout through search.
- Hardened checkout price/author parsing for Firestore numeric values.
- Changed the Android production application ID to
  `com.notesmarketplace.app`, which already exists in `google-services.json`.

## Before Play Store release

1. Create and securely store the release upload keystore and complete
   `android/key.properties` locally. Never commit the keystore or passwords.
2. Increment `version: 1.0.0+1` in `pubspec.yaml` for every uploaded release.
3. Run `flutter pub get`, `flutter analyze`, `flutter test`, and
   `flutter build appbundle --release` on the configured Flutter machine.
4. Test Firebase Auth, Firestore rules, Razorpay, HTML notes, notifications,
   AdMob consent, privacy policy, and account deletion on a physical Android
   device using the release build.
5. Upload the generated `.aab` to Play Console internal testing first.

## Content rule

- `category: school` and `category: college` are treated as free.
- For `category: other`, the admin's price is honoured; `0` is free and a
  positive value is paid.
