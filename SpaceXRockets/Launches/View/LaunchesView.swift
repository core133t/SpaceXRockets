//
//  LaunchesView.swift
//  SpaceXRockets
//
//  Created by Dmitry Loginov on 19.01.2024.
//

import SwiftUI

struct LaunchesView: View {
    
    @ObservedObject var viewModel: LaunchesViewModel
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                if !viewModel.launches.isEmpty {
                    ForEach(Array(viewModel.launches.enumerated()), id: \.offset) { index, launch in
                        LaunchCell(viewModel: launch).tag(index)
                    }
                } else {
                    ErrorLaunchCell()
                }
            }
        }
        .background(.regularMaterial)
    }
}

//#Preview {
//    LaunchesView()
//}
