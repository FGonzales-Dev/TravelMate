//
//  SignUpViewModel.swift
//  TravelMate
//
//  Created by Francis Gonzales on 6/26/25.
//

import Foundation

@MainActor

final class SignUpViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var isSignedUp: Bool = false
    
    
    private let registerUseCase: RegisterUserUseCase
    
    init(registerUserUseCase: RegisterUserUseCase) {
        self.registerUseCase = registerUserUseCase
    }
    
    func signUp() async {
        do {
            let user = try await registerUseCase.execute(email: email, password: password)
            print("Registered: \(user.email)")
            isSignedUp = true
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
