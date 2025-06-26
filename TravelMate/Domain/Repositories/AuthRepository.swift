//
//  AuthRepository.swift
//  TravelMate
//
//  Created by Francis Gonzales on 6/26/25.
//

import Foundation

protocol AuthRepository {
    func login(email: String, password: String) async throws -> User
    func register(email:String, password: String) async throws -> User
}
