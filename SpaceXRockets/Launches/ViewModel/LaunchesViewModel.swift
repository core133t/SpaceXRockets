//
//  LaunchesViewModel.swift
//  SpaceXRockets
//
//  Created by Dmitry Loginov on 03.03.2024.
//

import Combine

final class LaunchesViewModel: ObservableObject {
    
    @Published var launches: [LaunchModel] = []
    private var cancellable: AnyCancellable?
    
    init(rocketId: String) {
        cancellable = RocketsNetworkService.shared.fetchLaunchesInfo()
            .sink(
                receiveValue: { [weak self] launches in
                    self?.launches = launches.filter { $0.rocketId == rocketId && $0.success == true }
                }
            )
    }
}
