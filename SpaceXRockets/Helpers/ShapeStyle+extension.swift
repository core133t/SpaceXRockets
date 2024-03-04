//
//  ShapeStyle+extension.swift
//  SpaceXRockets
//
//  Created by Dmitry Loginov on 04.03.2024.
//

import SwiftUI

extension ShapeStyle where Self == TextLabelGray {
    static var textLabelGray: TextLabelGray { .init() }
}

struct TextLabelGray: ShapeStyle {
    func resolve(in environment: EnvironmentValues) -> some ShapeStyle {
        if environment.colorScheme == .light {
            return Color(red: 110/255, green: 110/255, blue: 110/255, opacity: 1.0)
        } else {
            return Color(red: 145/255, green: 145/255, blue: 145/255, opacity: 1.0)
        }
    }
}
