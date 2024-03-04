//
//  LaunchCell.swift
//  SpaceXRockets
//
//  Created by Dmitry Loginov on 19.01.2024.
//

import SwiftUI

struct LaunchCell: View {
    
    let viewModel: LaunchModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(viewModel.name)
                    .padding(EdgeInsets(top: 24, leading: 16, bottom: 0, trailing: 16))
                    .font(.title2)
                Text(TextFormatter.convertDateFormat(date: viewModel.dateLocal, from: .yyyyMMddTHHmmssZ, to: .MMMMdyyyy))
                    .foregroundStyle(.secondary)
                    .font(.subheadline)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 24, trailing: 16))
            }
            Spacer()
            RocketImage()
                .padding(16)
        }
        .background(.gray.opacity(0.3))
        .clipShape(.rect(cornerRadius: 24))
        .padding(EdgeInsets(top: 8, leading: 24, bottom: 0, trailing: 24))
    }
}

//#Preview {
//    LaunchCell()
//}
