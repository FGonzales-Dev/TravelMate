//
//  RootAuthSwitcher.swift
//  TravelMate
//
//  Created by Francis Gonzales on 6/26/25.
//

import Foundation
import SwiftUI

struct RootAuthSwitcher: View {
    @State private var showSignUp = false

    var body: some View {
        if showSignUp {
            let useCase = AppDIContainer.shared.container.resolve(RegisterUserUseCase.self)!
            SignUpView(viewModel: SignUpViewModel(registerUserUseCase: useCase))
                .toolbar {
                    Button("Already have an account?") {
                        showSignUp = false
                    }
                }
        } else {
            let useCase = AppDIContainer.shared.container.resolve(LoginUserUseCase.self)!
            LoginView(viewModel: LoginViewModel(loginUseCase: useCase),     onSignUpTapped: { showSignUp = true })
                .toolbar {
                    Button("Create account") {
                        showSignUp = true
                    }
                }
        }
    }
}
