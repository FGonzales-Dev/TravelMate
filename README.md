# 📱 TravelMate

**TravelMate** is a mobile travel companion app built with **Swift**, **SwiftUI**, and **Firebase**, structured using **Clean Architecture** for modularity, testability, and scalability.

---

## 🧰 Tech Stack

- **Frontend**: SwiftUI + Combine
- **Architecture**: Clean Architecture + Swinject (DI)
- **Backend**: Firebase (Auth, Firestore, Storage, Messaging)
- **State Management**: ObservableObject + Combine

---

## 🔧 Features

- 🔐 Firebase Auth (Google & Email login)
- 🗺 Discover curated travel destinations
- ✈️ Create and manage trip itineraries
- 🖼 Upload travel photos via Firebase Storage
- 🔔 Push notifications with Firebase Messaging

---

## 🗂 Folder Structure
TravelMate/
├── App/ # Entry point and DI setup
├── Presentation/ # SwiftUI Views & ViewModels
├── Domain/ # Entities, UseCases, Repositories (protocols)
├── Data/ # Firebase integrations
├── Resources/ # Assets and Constants
