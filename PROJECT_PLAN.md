# Premium Educational Notes Marketplace - Project Plan

*Last Synced: 2026-07-27*
*Before starting any new major feature, verify this doc reflects current implementation.*

**Project Status**: In Progress  
**Platform**: Flutter (Android, iOS, macOS, Windows, Web)  
**Backend**: Firebase  
**State Management**: Riverpod  
**Architecture**: Clean Architecture  
**Core Innovation**: Infinite Canvas Editor (Replacing traditional PDFs)

---

## Phase 1: Project Setup & Infrastructure (✅ COMPLETE)
- [x] Create Flutter project structure
- [x] Set up folder architecture (lib, assets, constants, etc.)
- [x] Configure dependencies in pubspec.yaml
- [x] Set up environment configuration
- [x] Initialize Riverpod and dependencies
- [x] Create theme and design system (Material Design 3)
- [x] Set up navigation and routing with GoRouter
- [x] Create all data models (User, Course, Subjects, etc.)
- [x] Create database schema documentation
- [x] Create common reusable UI widgets
- [x] Create documentation (README, guides, etc.)

## Phase 2: Authentication System & Firebase (✅ COMPLETE)
- [x] Create Firebase project and enable services (Auth, Firestore, Storage)
- [x] Download and configure google-services.json & GoogleService-Info.plist
- [x] Initialize Firebase in main.dart
- [x] Create FirebaseAuthService class
- [x] Implement login and signup flows
- [x] Create authentication state provider
- [x] Create login, signup, and welcome screen UI

## Phase 3: Infinite Canvas Architecture (✅ COMPLETE)
*(Historical Note: We originally planned to use PDF files for notes. This was abandoned in favor of a dynamic, JSON-driven Infinite Canvas to ensure responsive scaling on mobile devices and easy editing.)*
- [x] Create `BaseCanvasNode` polymorphic schema (Text, Sticker, Annotation, Connector)
- [x] Implement ScaleFactor logic (`CurrentDeviceWidth / 1000.0`)
- [x] Migrate `SubjectModel` to store canvas notes as a serialized JSON string in `content` field
- [x] Setup Flutter Quill for rich text node editing

## Phase 4: Admin Panel (✅ COMPLETE)
- [x] Create separate `study_notes_admin` Flutter Web app
- [x] Implement admin authentication
- [x] Create Academic Structure Management (Courses, Branches, Semesters, Subjects)
- [x] Build Infinite Canvas Editor for subjects
- [x] Implement Aesthetic Toolkit (Handwriting fonts, Box Styles, Stickers, Freehand Annotations, Bezier Connectors)
- [x] Implement drag-and-drop, resizing, and positioning of nodes
- [x] Implement Light/Dark mode toggle

## Phase 5: User App Viewer (✅ COMPLETE)
- [x] Build User App `SubjectContentScreen`
- [x] Parse polymorphic `BaseCanvasNode` JSON data
- [x] Apply `ScaleFactor` dynamically based on device width
- [x] Calculate total document height dynamically based on lowest node
- [x] Render Text nodes (with Box Styles)
- [x] Render Sticker nodes (SVGs)
- [x] Render Annotation nodes (`CustomPainter`)
- [x] Render Connector nodes (`CustomPainter`)

## Phase 6: Home Screen & Main Navigation (IN PROGRESS)
- [ ] Create bottom navigation bar
- [ ] Design home screen UI
- [ ] Implement search bar
- [ ] Create "Continue Reading" section
- [ ] Create "Recently Added Subjects" section
- [ ] Create "Popular Subjects" section
- [ ] Create "My Purchased Subjects" section
- [ ] Create navigation structure

## Phase 7: Courses & Subject Marketplace
- [ ] Create courses screen
- [ ] Create course details screen
- [ ] Create branch selection in course
- [ ] Create semester selection in branch
- [ ] Create subject listing screen
- [ ] Design subject card UI
- [ ] Implement notes preview functionality

## Phase 8: Payment Integration
- [ ] Set up Razorpay integration
- [ ] Create payment processor service
- [ ] Implement single purchase flow
- [ ] Create subscription plans management
- [ ] Store purchase records in Firestore

## Phase 9: Profile & Settings
- [ ] Create profile screen UI
- [ ] Display user details and purchased subjects
- [ ] Display subscription status
- [ ] Create purchase history view
- [ ] Implement profile editing
- [ ] Create settings screen (Dark/Light mode toggle)

## Phase 10: Security & Offline Access
- [ ] Implement encrypted local storage for offline access to JSON canvas data
- [ ] Implement screenshot prevention
- [ ] Review Firebase security rules

## Phase 11: Deployment & Release
- [ ] Build release APK for Android
- [ ] Build release IPA for iOS
- [ ] Deploy Admin Panel to Firebase Hosting
- [ ] Submit to Google Play Store & Apple App Store

---

## Current Progress Summary
**Completed**: Phases 1 through 5 are fully complete.  
**In Progress**: Ready for Phase 6 - Home Screen & Main Navigation.  
**Overall Progress**: ~45% - The core complex architecture (Infinite Canvas Editor and Viewer) is finished!

## Key Decisions & Notes
- **Riverpod**: State management.
- **Clean Architecture**: Code organization.
- **Firebase**: Backend (Auth, Firestore, Storage, FCM).
- **Infinite Canvas**: Subjects content is NOT a PDF. It is a JSON string of absolute positioned elements dynamically scaled using `ScaleFactor`.
- **Admin Width**: The editor canvas is fixed at `1000px` base width. All coordinates saved to DB are relative to this base width.

