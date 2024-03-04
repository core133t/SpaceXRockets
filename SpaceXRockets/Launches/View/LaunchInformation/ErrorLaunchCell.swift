//
//  ErrorLaunchCell.swift
//  SpaceXRockets
//
//  Created by Dmitry Loginov on 04.03.2024.
//

import SwiftUI

struct ErrorLaunchCell: View {
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("No information available")
                    .padding(EdgeInsets(top: 32, leading: 16, bottom: 32, trailing: 16))
                    .font(.title2)
            }
            Spacer()
            Image(systemName: "x.circle.fill")
                .resizable()
                .foregroundStyle(.red)
                .frame(width: 27, height: 27)
                .padding(EdgeInsets(top: 32, leading: 16, bottom: 32, trailing: 16))
        }
        .background(.gray.opacity(0.3))
        .clipShape(.rect(cornerRadius: 24))
        .padding(EdgeInsets(top: 8, leading: 24, bottom: 0, trailing: 24))
    }
}

#Preview {
    ErrorLaunchCell()
}
