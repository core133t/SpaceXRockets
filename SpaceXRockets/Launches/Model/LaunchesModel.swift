//
//  LaunchesModel.swift
//  SpaceXRockets
//
//  Created by Dmitry Loginov on 03.03.2024.
//

import Foundation

struct LaunchModel: Decodable {
    
    let rocketId: String
    let name: String
    let dateLocal: String
    let dateUTC: String
    let success: Bool?
    
    enum CodingKeys: String, CodingKey {
        case rocketId = "rocket"
        case name
        case dateLocal = "date_local"
        case success
        case dateUTC = "date_utc"
    }
}
