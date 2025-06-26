//
//  SignUpView.swift
//  TravelMate
//
//  Created by Francis Gonzales on 6/26/25.
//

import Foundation
import SwiftUI

struct SignUpView: View {
    
    @StateObject var viewModel: SignUpViewModel
    
    init(viewModel: SignUpViewModel) {
        _viewModel = StateObject(wrappedValue:viewModel)
    }
    
    var body: some View {
        VStack(spacing:16){
            TextField("Email", text: $viewModel.email)
                .autocapitalization(.none)
                .textFieldStyle(.roundedBorder)
            SecureField("Password", text: $viewModel.password)
                .autocapitalization(.none)
                .textFieldStyle(.roundedBorder)
            SecureField("Confirm Password", text: $viewModel.confirmPassword)
                .autocapitalization(.none)
                .textFieldStyle(.roundedBorder)
            
            if let error = viewModel.errorMessage {
                Text(error).foregroundColor(.red)
            }
            
            Button("Sign Up"){
                Task{
                    await viewModel.signUp()
                }
            }
            .disabled(viewModel.isLoading)
           
        }
        .padding()
    }
}
