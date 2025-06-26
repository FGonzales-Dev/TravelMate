//
//  LoginViewModel.swift
//  TravelMate
//
//  Created by Francis Gonzales on 6/26/25.
//

import Foundation

@MainActor
final class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var isLoggedIn = false
    
    private let loginUseCase: LoginUserUseCase
    
    init(loginUseCase: LoginUserUseCase) {
          self.loginUseCase = loginUseCase
      }
    
    func login() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let user = try await loginUseCase.execute(email: email, password: password)
            print("logged in as \(user.email)")
            isLoggedIn = true
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
