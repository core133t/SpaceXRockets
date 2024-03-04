//
//  RocketInformationCell.swift
//  SpaceXRockets
//
//  Created by Dmitry Loginov on 21.01.2024.
//

import SwiftUI

enum Unit: String {
    case ft
    case m
    case lb
    case kg
}

struct RocketInformationCell: View {
    
    var value: Double
    var subtitle: String
    var unit: String
    private let separator: String = ", "
    
    init(_ value: Double, _ subtitle: String, unit: Unit) {
        self.value = value
        self.subtitle = subtitle
        self.unit = unit.rawValue
    }
    
    var body: some View {
        VStack() {
            Text(String(value))
                .bold()
                .padding(.bottom, 2)
            Text(subtitle + separator + unit)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding(18)
        .background(.gray.opacity(0.3))
        .clipShape(.rect(cornerRadius: 28))
    }
}

//#Preview {
//    RocketInformationCell()
//}
