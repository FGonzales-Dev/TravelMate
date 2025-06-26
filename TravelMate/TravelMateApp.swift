//
//  TravelMateApp.swift
//  TravelMate
//
//  Created by Francis Gonzales on 6/25/25.
//

import SwiftUI
import Firebase

@main
struct TravelMateApp: App {
    init() {
        FirebaseApp.configure()
    }

    @State private var showSignUp = false

    var body: some Scene {
        WindowGroup {
            RootAuthSwitcher()
        }
    }
}
