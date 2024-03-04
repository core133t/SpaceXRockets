//
//  RocketsNetworkService.swift
//  SpaceXRockets
//
//  Created by Dmitry Loginov on 04.02.2024.
//

import Foundation
import Combine

struct RocketsNetworkService {
    
    static let shared = RocketsNetworkService()
    
    private enum Endpoint: String {
        case rockets
        case launches
    }
    private let baseURL: URL = URL(string: "https://api.spacexdata.com/v4/") ?? URL(fileURLWithPath: String())

    func fetch<T: Decodable>(_ request: URL) -> AnyPublisher<T, Error> {
        URLSession.shared
            .dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func fetchRocketsInfo() -> AnyPublisher<[RocketModel], Never> {
        fetch(baseURL.appendingPathComponent(Endpoint.rockets.rawValue))
            .replaceError(with: [RocketModel]())
            .eraseToAnyPublisher()
    }
    
    func fetchLaunchesInfo() -> AnyPublisher<[LaunchModel], Never> {
        fetch(baseURL.appendingPathComponent(Endpoint.launches.rawValue))
            .replaceError(with: [LaunchModel]())
            .eraseToAnyPublisher()
    }
}
