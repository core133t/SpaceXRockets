//
//  RocketsView.swift
//  SpaceXRockets
//
//  Created by Dmitry Loginov on 19.01.2024.
//

import SwiftUI
import Combine

struct RocketsView: View {
    
    @ObservedObject var viewModel: RocketsViewModel
    @State var rocketImageURL: URL = URL(fileURLWithPath: String())
    @State private var path = NavigationPath()
    @State var presentSheet = false
    @State var rocketSelectedIndex: Int = 0

    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                AsyncImage(url: rocketImageURL)
                    .onReceive(viewModel.didLoad) { _ in
                        self.rocketImageURL = viewModel.getRocketImageURL(rocketSelectedIndex)
                    }
                    .onAppear {
                        presentSheet = true
                    }
                    .sheet(isPresented: $presentSheet) {
                        TabView(selection: $rocketSelectedIndex) {
                            ForEach(Array(viewModel.rockets.enumerated()), id: \.offset) { index, rocket in
                                RocketInformationView(nav: $path, viewModel: rocket).tag(index)
                            }
                        }
                        .onChange(of: rocketSelectedIndex) { oldValue, newValue in
                            rocketImageURL = viewModel.getRocketImageURL(rocketSelectedIndex)
                        }
                        .padding(EdgeInsets(top: 24, leading: 0, bottom: -25, trailing: 0))
                        .tabViewStyle(.page)
                        .indexViewStyle(.page(backgroundDisplayMode: .always))
                        .presentationDetents([.fraction(0.5), .fraction(0.8)])
                        .presentationBackgroundInteraction(.enabled)
                        .presentationDragIndicator(.hidden)
                        .presentationCornerRadius(50)
                        .interactiveDismissDisabled()
                    }
                    .ignoresSafeArea()
                
                Spacer()
            }
            .background(.regularMaterial)
            .navigationDestination(for: String.self ) { rocketId in
                LaunchesView(viewModel: LaunchesViewModel(rocketId: rocketId))
            }
        }
        .tint(.primary)
    }
}
