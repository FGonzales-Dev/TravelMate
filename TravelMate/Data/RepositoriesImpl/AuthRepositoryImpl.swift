//
//  AuthRepositoryImpl.swift
//  TravelMate
//
//  Created by Francis Gonzales on 6/26/25.
//

import Foundation

final class AuthRepositoryImpl: AuthRepository {
    private let dataSource: FirebaseAuthDataSource
    
    init(dataSource: FirebaseAuthDataSource){
        self.dataSource = dataSource
    }
    func login(email: String, password: String) async throws -> User {
        let user = try await dataSource.signIn(email: email, password: password)
        return User(id: user.uid, email: user.email ?? "")
    }
}
