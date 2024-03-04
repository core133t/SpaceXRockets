//
//  RocketsViewModel.swift
//  SpaceXRockets
//
//  Created by Dmitry Loginov on 07.02.2024.
//

import Foundation
import Combine

final class RocketsViewModel: ObservableObject {
    
    var didLoad = PassthroughSubject<[RocketModel], Never>()
    private var cancellable: AnyCancellable?
    
    @Published var rockets: [RocketModel] = Array() {
        didSet {
            didLoad.send(rockets)
        }
    }
    
    init() {
        cancellable = RocketsNetworkService.shared.fetchRocketsInfo()
            .sink(
                receiveValue: { [weak self] rockets in
                    self?.rockets = rockets
                }
            )
    }
    
    func getRocketImageURL(_ index: Int) -> URL {
        guard let link = rockets[index].flickrImages.randomElement(),
              let url = URL(string: link)
        else { return URL(fileURLWithPath: String()) }
        
        return url
    }
}
