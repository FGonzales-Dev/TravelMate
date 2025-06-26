//
//  AppDiContainer.swift
//  TravelMate
//
//  Created by Francis Gonzales on 6/26/25.
//

import Foundation
import Swinject

final class AppDIContainer {
    static let shared = AppDIContainer()
    let container = Container()

    private init() {
        container.register(FirebaseAuthDataSource.self) { _ in FirebaseAuthDataSource() }
        container.register(AuthRepository.self) { r in
            AuthRepositoryImpl(dataSource: r.resolve(FirebaseAuthDataSource.self)!)
        }
        container.register(LoginUserUseCase.self) { r in
            LoginUserUseCase(repository: r.resolve(AuthRepository.self)!)
        }
        container.register(RegisterUserUseCase.self) { r in
            RegisterUserUseCase(repository: r.resolve(AuthRepository.self)!)
        }
    }
}
