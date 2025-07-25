//
//  RegisterUserUseCase.swift
//  TravelMate
//
//  Created by Francis Gonzales on 6/26/25.
//

import Foundation

struct RegisterUserUseCase {
    private let repository: AuthRepository
    
    init(repository: AuthRepository) {
        self.repository = repository
    }
    
    func execute(email: String, password: String) async throws -> User{
        return try await repository.register(email: email, password: password)
    }
}
