//
//  RocketInformationLabel.swift
//  SpaceXRockets
//
//  Created by Dmitry Loginov on 22.01.2024.
//

import SwiftUI

struct RocketInformationLabel: View {
    
    var leftTitle: String
    var rightTitle: String
    
    var body: some View {
        HStack {
            Text(leftTitle)
                .foregroundStyle(.textLabelGray)
            Spacer()
            Text(rightTitle)
        }
        .padding(EdgeInsets(top: 0, leading: 24, bottom: 16, trailing: 24))
    }
}

//#Preview {
//    RocketInformationLabel()
//}
