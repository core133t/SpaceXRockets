//
//  SpaceXRocketsApp.swift
//  SpaceXRockets
//
//  Created by Dmitry Loginov on 19.01.2024.
//

import SwiftUI

@main
struct SpaceXRocketsApp: App {
    var body: some Scene {
        WindowGroup {
            RocketsView(viewModel: RocketsViewModel())
        }
    }
}
