//
//  LoginView.swift
//  TravelMate
//
//  Created by Francis Gonzales on 6/26/25.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel
    let onSignUpTapped: () -> Void
    
    init(viewModel: LoginViewModel, onSignUpTapped: @escaping () -> Void) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.onSignUpTapped = onSignUpTapped
    }

    var body: some View {
        VStack(spacing: 16) {
            TextField("Email", text: $viewModel.email)
                .autocapitalization(.none)
                .textFieldStyle(.roundedBorder)

            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(.roundedBorder)

            if let error = viewModel.errorMessage {
                Text(error).foregroundStyle(.red)
            }

            Button("Login") {
                Task {
                    await viewModel.login()
                }
            }
            .disabled(viewModel.isLoading)
            
            Button("Don't have an account? Sign Up") {
                          onSignUpTapped()
                      }
                      .font(.footnote)
                      .foregroundColor(.blue)
        }
        .padding()
    }
}

