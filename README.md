# 📱 TravelMate

**TravelMate** is a modular, scalable, and testable mobile travel companion app built with **Swift**, **SwiftUI**, and **Firebase**. The project follows **Clean Architecture** and **MVVM** (Model-View-ViewModel) patterns, leveraging **Swinject** for dependency injection.

---

## 🏛 Architecture Overview

TravelMate is structured using **Clean Architecture** principles, separating concerns into layers:

- **Presentation Layer**: SwiftUI Views and ViewModels (MVVM)
- **Domain Layer**: Business logic, UseCases, Entities, and Repository protocols
- **Data Layer**: Data sources and repository implementations

This separation ensures testability, maintainability, and scalability.

---

## 🗂 Folder Structure & File Roles

```
TravelMate/
├── App/
│   ├── App.swift
│   └── DI/
│       └── AppDiContainer.swift
├── Assets.xcassets/
├── ContentView.swift
├── Data/
│   ├── DataSources/
│   │   └── FirebaseAuthDataSource.swift
│   └── RepositoriesImpl/
│       └── AuthRepositoryImpl.swift
├── Domain/
│   ├── Entities/
│   │   └── User.swift
│   ├── Repositories/
│   │   └── AuthRepository.swift
│   └── UseCases/
│       ├── LoginUserUseCase.swift
│       └── RegisterUserUseCase.swift
├── Info.plist
├── Presentation/
│   └── Auth/
│       ├── RootAuthSwitcher.swift
│       ├── Login/
│       │   ├── Views/
│       │   │   └── LoginView.swift
│       │   └── ViewModels/
│       │       └── LoginViewModel.swift
│       └── SignUp/
│           ├── Views/
│           │   └── SignUpView.swift
│           └── ViewModels/
│               └── SignUpViewModel.swift
└── TravelMateApp.swift
```

---

### **App/**

- **App.swift**: (empty, reserved for future app-level logic)
- **DI/AppDiContainer.swift**: Sets up the dependency injection container using Swinject. Registers all data sources, repositories, and use cases for injection throughout the app.

### **Assets.xcassets/**

- Contains app icons and color assets.

### **ContentView.swift**

- A sample SwiftUI view (currently not used in the main flow).

### **Data/**

- **DataSources/FirebaseAuthDataSource.swift**: Handles direct communication with Firebase Auth SDK for sign-in and sign-up.
- **RepositoriesImpl/AuthRepositoryImpl.swift**: Implements the [`AuthRepository`](TravelMate/Domain/Repositories/AuthRepository.swift) protocol, using the data source to perform authentication and mapping Firebase users to domain [`User`](TravelMate/Domain/Entities/User.swift) entities.

### **Domain/**

- **Entities/User.swift**: Defines the core [`User`](TravelMate/Domain/Entities/User.swift) entity used throughout the app.
- **Repositories/AuthRepository.swift**: Protocol defining authentication operations (login, register) abstracted from the data source.
- **UseCases/LoginUserUseCase.swift**: Business logic for logging in a user, using the repository.
- **UseCases/RegisterUserUseCase.swift**: Business logic for registering a user, using the repository.

### **Info.plist**

- App configuration, including Firebase URL schemes.

### **Presentation/**

- **Auth/RootAuthSwitcher.swift**: SwiftUI view that switches between login and sign-up flows based on user interaction.
- **Auth/Login/Views/LoginView.swift**: SwiftUI view for user login, binds to [`LoginViewModel`](TravelMate/Presentation/Auth/SignUp/ViewModels/LoginViewModel.swift).
- **Auth/Login/ViewModels/LoginViewModel.swift**: ViewModel for login, interacts with [`LoginUserUseCase`](TravelMate/Domain/UseCases/LoginUserUseCase.swift).
- **Auth/SignUp/Views/SignUpView.swift**: SwiftUI view for user registration, binds to [`SignUpViewModel`](TravelMate/Presentation/Auth/Login/ViewModels/SignUpViewModel.swift).
- **Auth/SignUp/ViewModels/SignUpViewModel.swift**: ViewModel for sign-up, interacts with [`RegisterUserUseCase`](TravelMate/Domain/UseCases/RegisterUserUseCase.swift).

### **TravelMateApp.swift**

- The main app entry point. Initializes Firebase and sets the root view to [`RootAuthSwitcher`](TravelMate/Presentation/Auth/RootAuthSwitcher.swift).

---

## 🔗 How Everything Connects

1. **App Launch**:  
   [`TravelMateApp`](TravelMate/TravelMateApp.swift) initializes Firebase and shows [`RootAuthSwitcher`](TravelMate/Presentation/Auth/RootAuthSwitcher.swift).

2. **Dependency Injection**:  
   [`AppDIContainer`](TravelMate/App/DI/AppDiContainer.swift) registers all dependencies (data sources, repositories, use cases).

3. **Authentication Flow**:  
   - **Login**:  
     [`LoginView`](TravelMate/Presentation/Auth/Login/Views/LoginView.swift) ⇄ [`LoginViewModel`](TravelMate/Presentation/Auth/SignUp/ViewModels/LoginViewModel.swift) → [`LoginUserUseCase`](TravelMate/Domain/UseCases/LoginUserUseCase.swift) → [`AuthRepository`](TravelMate/Domain/Repositories/AuthRepository.swift) → [`AuthRepositoryImpl`](TravelMate/Data/RepositoriesImpl/AuthRepositoryImpl.swift) → [`FirebaseAuthDataSource`](TravelMate/Data/DataSources/FirebaseAuthDataSource.swift)
   - **Sign Up**:  
     [`SignUpView`](TravelMate/Presentation/Auth/SignUp/Views/SignUpView.swift) ⇄ [`SignUpViewModel`](TravelMate/Presentation/Auth/Login/ViewModels/SignUpViewModel.swift) → [`RegisterUserUseCase`](TravelMate/Domain/UseCases/RegisterUserUseCase.swift) → [`AuthRepository`](TravelMate/Domain/Repositories/AuthRepository.swift) → [`AuthRepositoryImpl`](TravelMate/Data/RepositoriesImpl/AuthRepositoryImpl.swift) → [`FirebaseAuthDataSource`](TravelMate/Data/DataSources/FirebaseAuthDataSource.swift)

---

## 🛠️ Tech Stack

- **Swift**, **SwiftUI**
- **Firebase** (Auth)
- **Swinject** (Dependency Injection)
- **Clean Architecture** + **MVVM**

---

## 📄 File Reference

- [`TravelMateApp`](TravelMate/TravelMateApp.swift)
- [`AppDIContainer`](TravelMate/App/DI/AppDiContainer.swift)
- [`RootAuthSwitcher`](TravelMate/Presentation/Auth/RootAuthSwitcher.swift)
- [`LoginView`](TravelMate/Presentation/Auth/Login/Views/LoginView.swift)
- [`LoginViewModel`](TravelMate/Presentation/Auth/SignUp/ViewModels/LoginViewModel.swift)
- [`SignUpView`](TravelMate/Presentation/Auth/SignUp/Views/SignUpView.swift)
- [`SignUpViewModel`](TravelMate/Presentation/Auth/Login/ViewModels/SignUpViewModel.swift)
- [`LoginUserUseCase`](TravelMate/Domain/UseCases/LoginUserUseCase.swift)
- [`RegisterUserUseCase`](TravelMate/Domain/UseCases/RegisterUserUseCase.swift)
- [`AuthRepository`](TravelMate/Domain/Repositories/AuthRepository.swift)
- [`AuthRepositoryImpl`](TravelMate/Data/RepositoriesImpl/AuthRepositoryImpl.swift)
- [`FirebaseAuthDataSource`](TravelMate/Data/DataSources/FirebaseAuthDataSource.swift)
- [`User`](TravelMate/Domain/Entities/User.swift)

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
