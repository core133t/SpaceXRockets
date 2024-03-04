//
//  RocketImage.swift
//  SpaceXRockets
//
//  Created by Dmitry Loginov on 19.01.2024.
//

import SwiftUI

struct RocketImage: View {
    var body: some View {
        HStack {
            Image("spaceRocket")
                .resizable()
                .renderingMode(.template)
                .foregroundStyle(.gray)
                .frame(width: 35, height: 35)
            Image(systemName: "checkmark.circle.fill")
                .frame(width: 10, height: 10)
                .background(.white)
                .foregroundStyle(.green)
                .offset(x: -12, y: 10)
        }
    }
}

#Preview {
    RocketImage()
}
