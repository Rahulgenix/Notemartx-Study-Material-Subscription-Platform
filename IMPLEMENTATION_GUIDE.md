# Implementation Guide

This guide provides step-by-step instructions for implementing the Notes Marketplace app.
*Last Synced: 2026-07-27*

## Phase 1: Project Setup (COMPLETED)

✅ Created Flutter project structure  
✅ Set up dependencies in pubspec.yaml  
✅ Created folder architecture with Clean Architecture pattern  
✅ Created theme system with Material Design 3  
✅ Created all data models (User, Course, Subjects, Purchase, Subscription, etc.)  
✅ Set up Riverpod providers  
✅ Created extensions and utilities  
✅ Created database schema documentation  

## Phase 2: Authentication & Firebase Setup (COMPLETED)

### 2.1 Firebase Configuration
- [x] Create Firebase project
- [x] Enable Authentication (Email/Password, Google, Phone)
- [x] Enable Cloud Firestore
- [x] Enable Firebase Storage
- [x] Enable Cloud Messaging
- [x] Initialize Firebase in main.dart

### 2.2 Authentication Service & UI
- [x] Create FirebaseAuthService class
- [x] Implement login and signup flows
- [x] Create authentication state provider
- [x] Create splash, login, signup screens

## Phase 3: Infinite Canvas Architecture (COMPLETED)

### 3.1 Node Data Models
- [x] Create polymorphic `BaseCanvasNode`
- [x] Create `CanvasNode` for rich text
- [x] Create `StickerNode` for doodle SVGs
- [x] Create `AnnotationNode` for freehand drawing
- [x] Create `ConnectorNode` for Bezier arrows

### 3.2 Dynamic Scaling Engine
- [x] Implement `ScaleFactor` logic (CurrentDeviceWidth / 1000.0)
- [x] Establish 1000px absolute base width for Admin Editor
- [x] Dynamically calculate `_totalDocumentHeight` based on maximum Y coordinates

## Phase 4: Admin Panel (COMPLETED)

### 4.1 Admin Project Setup
- [x] Create `study_notes_admin` Flutter Web app
- [x] Configure Firebase for Admin Panel
- [x] Create Admin Layout and sidebar

### 4.2 Content Editing (Aesthetic Toolkit)
- [x] Implement Infinite Canvas drag-and-drop editor
- [x] Add Handwriting Fonts (Caveat, Kalam, etc.)
- [x] Implement Box Styles (Pastel Card, Dashed Border, Sticky Note, Highlight)
- [x] Build Sticker Panel library
- [x] Implement Freehand Annotation gesture handling
- [x] Implement 2-click Connector drawing logic
- [x] Save polymorphic nodes to JSON in `SubjectModel.content`

## Phase 5: User App Viewer (COMPLETED)

### 5.1 Content Parsing
- [x] Deserialize JSON into `BaseCanvasNode` subclasses
- [x] Load `quill.Document` for text nodes

### 5.2 Content Rendering
- [x] Build `SubjectContentScreen` Stack viewer
- [x] Enforce consistent line-height and font constraints
- [x] Render SVG stickers using `flutter_svg`
- [x] Draw annotations and connectors using custom painters

## Phase 6: Marketplace & Navigation (IN PROGRESS)

### 6.1 Home Screen
- [ ] Create welcome banner widget
- [ ] Create search bar component
- [ ] Create "Continue Reading" section
- [ ] Create "Recently Added Subjects" section
- [ ] Create "Popular Subjects" section

### 6.2 Courses Screen
- [ ] Create courses list screen
- [ ] Implement course/branch/semester selection flow
- [ ] Create subject listing screen

## Phase 7: Purchase & Payment

### 7.1 Purchase Flow
- [ ] Create purchase confirmation screen
- [ ] Implement Razorpay payment integration
- [ ] Store purchase records in Firestore

### 7.2 Subscription Management
- [ ] Create subscription plans display
- [ ] Create subscription purchase flow

## Phase 8: Profile, Security & Offline Access

### 8.1 Profile Settings
- [ ] Create profile screen layout
- [ ] Implement dark/light mode toggle
- [ ] Create purchase history view

### 8.2 Security
- [ ] Implement screenshot prevention
- [ ] Implement encrypted local storage for offline canvas data caching

---

## Development Notes

### Technology Stack Summary
- **Frontend**: Flutter 3.0+
- **State Management**: Riverpod
- **Backend**: Firebase (Auth, Firestore, Storage, FCM)
- **Payment Gateway**: Razorpay
- **Core Engine**: Infinite Canvas (Polymorphic JSON, Flutter Quill, Custom Painters)

### Code Standards
- Follow Clean Architecture principles
- Scale uniformly using `ScaleFactor = screenWidth / _baseCanvasWidth`
