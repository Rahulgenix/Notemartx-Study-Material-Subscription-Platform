# Firestore Database Schema

*Last Synced: 2026-07-27*

## Collections Overview

### 1. Users Collection (`users`)
```json
{
  "id": "user-uuid",
  "email": "user@example.com",
  "fullName": "John Doe",
  "phoneNumber": "+91-9876543210",
  "profileImageUrl": "gs://bucket/image.jpg",
  "selectedCourse": "B.Tech",
  "selectedBranch": "Computer Science",
  "selectedSemester": "3",
  "purchasedSubjectIds": ["subject-id-1", "subject-id-2"],
  "subscriptionPlanId": "plan-premium-monthly",
  "subscriptionExpiryDate": "2024-08-09",
  "isActive": true,
  "createdAt": "2024-07-09T10:30:00Z",
  "updatedAt": "2024-07-09T10:30:00Z"
}
```

**Indexes:**
- email (ascending)
- selectedCourse, selectedBranch, selectedSemester
- subscriptionExpiryDate (descending)
- isActive (ascending)

---

### 2. Courses Collection (`courses`)
```json
{
  "id": "course-uuid",
  "name": "B.Tech",
  "description": "Bachelor of Technology",
  "imageUrl": "gs://bucket/course-img.jpg",
  "totalBranches": 5,
  "isActive": true,
  "createdAt": "2024-01-01T00:00:00Z"
}
```

---

### 3. Branches Collection (`branches`)
```json
{
  "id": "branch-uuid",
  "courseId": "course-uuid",
  "name": "Computer Science and Engineering",
  "description": "CSE Branch",
  "totalSemesters": 8,
  "isActive": true,
  "createdAt": "2024-01-01T00:00:00Z"
}
```

---

### 4. Semesters Collection (`semesters`)
```json
{
  "id": "semester-uuid",
  "branchId": "branch-uuid",
  "name": "Semester 3",
  "semesterNumber": 3,
  "totalSubjects": 5,
  "isActive": true,
  "createdAt": "2024-01-01T00:00:00Z"
}
```

---

### 5. Subjects Collection (`subjects`)
*(Replaces the traditional concept of 'Notes/PDFs')*
```json
{
  "id": "subject-uuid",
  "semesterId": "semester-uuid",
  "name": "Data Structures",
  "description": "Advanced Data Structures and Algorithms",
  "code": "CS301",
  "content": "[{\"type\": \"text\", \"baseX\": 100, \"baseY\": 200, ...}, {\"type\": \"sticker\", ...}]",
  "isActive": true,
  "createdAt": "2024-01-01T00:00:00Z"
}
```
**Important Note:** The `content` field contains a serialized JSON string representing an array of polymorphic `BaseCanvasNode` objects (Text, Stickers, Annotations, Connectors). This drives the Infinite Canvas viewer on the User App and is edited directly from the Admin Panel.

---

### 6. Purchases Collection (`purchases`)
```json
{
  "id": "purchase-uuid",
  "userId": "user-uuid",
  "subjectId": "subject-uuid",
  "amount": 149.99,
  "discountApplied": 50.00,
  "paymentMethod": "razorpay",
  "transactionId": "razorpay_transaction_id",
  "status": "completed",
  "purchaseDate": "2024-07-09T10:30:00Z",
  "accessExpiryDate": null
}
```

---

### 7. Subscriptions Collection (`subscriptions`)
```json
{
  "id": "subscription-uuid",
  "planName": "Premium Monthly",
  "planId": "premium-monthly",
  "monthlyPrice": 299.99,
  "quarterlyPrice": 799.99,
  "yearlyPrice": 2499.99,
  "discountPercentage": 30.0,
  "description": "Premium access to all content",
  "benefits": ["30% discount", "Offline access", "Priority support"],
  "isActive": true,
  "createdAt": "2024-01-01T00:00:00Z"
}
```

---

### 8. User Subscriptions Collection (`user_subscriptions`)
```json
{
  "id": "user-subscription-uuid",
  "userId": "user-uuid",
  "subscriptionPlanId": "subscription-uuid",
  "planName": "Premium Monthly",
  "duration": "monthly",
  "amountPaid": 299.99,
  "startDate": "2024-07-09T00:00:00Z",
  "expiryDate": "2024-08-09T23:59:59Z",
  "status": "active",
  "cancelledAt": null
}
```

---

### 9. Payment Transactions Collection (`payment_transactions`)
```json
{
  "id": "transaction-uuid",
  "userId": "user-uuid",
  "amount": 149.99,
  "currency": "INR",
  "paymentMethod": "razorpay",
  "razorpayOrderId": "order_id",
  "razorpayPaymentId": "payment_id",
  "razorpaySignature": "signature",
  "status": "completed",
  "description": "Purchase of Subject",
  "metadata": {
    "subjectId": "subject-uuid",
    "subscriptionId": null
  },
  "createdAt": "2024-07-09T10:30:00Z",
  "updatedAt": "2024-07-09T10:30:00Z"
}
```

---

## Firebase Storage Structure

```
gs://bucket/
├── profiles/
│   └── {userId}/
│       └── profile-image.jpg
└── thumbnails/
    └── {subjectId}/
        └── thumbnail.jpg
```
*(Note: PDF storage directories have been deprecated with the move to the Infinite Canvas Architecture)*

---

## Data Relationships

```
Users
├─ Courses (selected one)
│  ├─ Branches (selected one)
│  │  └─ Semesters
│  │     └─ Subjects
│  │        └─ Purchases (by current user)
├─ Purchases (all purchases by user)
└─ User Subscriptions (current active subscription)

Subscriptions
└─ User Subscriptions (active user subscriptions)
```
