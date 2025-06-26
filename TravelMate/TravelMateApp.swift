//
//  TravelMateApp.swift
//  TravelMate
//
//  Created by Francis Gonzales on 6/25/25.
//

import SwiftUI
import Firebase

@main
struct TravelMateApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            let useCase = AppDIContainer.shared.container.resolve(LoginUserUseCase.self)!
                        LoginView(viewModel: LoginViewModel(loginUseCase: useCase))
        }
    }
}
