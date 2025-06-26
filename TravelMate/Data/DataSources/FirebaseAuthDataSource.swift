//
//  FirebaseAuthDataSource.swift
//  TravelMate
//
//  Created by Francis Gonzales on 6/26/25.
//

import Foundation
import FirebaseAuth

final class FirebaseAuthDataSource {
    func signIn(email: String, password: String) async throws -> FirebaseAuth.User {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        return result.user
    }
    
    func signUp(email: String, password: String) async throws -> FirebaseAuth.User {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        return result.user
    }
}
