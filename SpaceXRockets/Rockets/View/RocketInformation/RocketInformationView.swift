//
//  RocketInformationView.swift
//  SpaceXRockets
//
//  Created by Dmitry Loginov on 21.01.2024.
//

import SwiftUI

struct RocketInformationView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    @Binding var nav: NavigationPath
    let viewModel: RocketModel
    
    private enum Constants {
        static let titleLabelInsets = EdgeInsets(top: 8, leading: 24, bottom: 8, trailing: 24)
        static let collectionInsets = EdgeInsets(top: 0, leading: 24, bottom: 16, trailing: 24)
    }
    
    var body: some View {
        VStack() {
            HStack() {
                Text(viewModel.name)
                    .font(.title)
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "gearshape")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .tint(.primary)
                }
                
            }
            .padding(Constants.titleLabelInsets)
            
            ScrollView(.vertical, showsIndicators: false) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        RocketInformationCell(viewModel.height.meters ?? .zero, "Height", unit: .m)
                        RocketInformationCell(viewModel.diameter.meters ?? .zero, "Diameter", unit: .m)
                        RocketInformationCell(Double(viewModel.mass.kg), "Mass", unit: .kg)
                        RocketInformationCell(Double(viewModel.payloadWeights[.zero].kg), "Payload", unit: .kg)
                    }
                }
                .padding(Constants.collectionInsets)
                
                VStack {
                    RocketInformationLabel(leftTitle: "First flight", rightTitle: viewModel.firstFlight)
                    RocketInformationLabel(leftTitle: "Country", rightTitle: viewModel.country)
                    RocketInformationLabel(leftTitle: "Cost per launch", rightTitle: String(viewModel.costPerLaunch))
                    
                    HStack() {
                        Text("FIRST STAGE")
                            .bold()
                        Spacer()
                    }
                    .padding(Constants.titleLabelInsets)
                    
                    RocketInformationLabel(leftTitle: "Engines", rightTitle: String(viewModel.firstStage.engines))
                    RocketInformationLabel(leftTitle: "Fuel amount", rightTitle: String(viewModel.firstStage.fuelAmountTons))
                    RocketInformationLabel(leftTitle: "Burn time", rightTitle: String(viewModel.firstStage.burnTimeSec ?? .zero))
                    
                    HStack() {
                        Text("SECOND STAGE")
                            .bold()
                        Spacer()
                    }
                    .padding(Constants.titleLabelInsets)
                    
                    RocketInformationLabel(leftTitle: "Engines", rightTitle: String(viewModel.secondStage.engines))
                    RocketInformationLabel(leftTitle: "Fuel amount", rightTitle: String(viewModel.secondStage.fuelAmountTons))
                    RocketInformationLabel(leftTitle: "Burn time", rightTitle: String(viewModel.secondStage.burnTimeSec ?? .zero))
                    
                    Button {
                        nav.append(viewModel.id)
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Show launches")
                            .frame(width: 300, height: 50)
                            .background(.gray.opacity(0.3))
                            .clipShape(.rect(cornerRadius: 12))
                            .tint(.primary)
                            .bold()
                    }
                    .padding(.bottom, 20)
                }
                Spacer()
            }
        }
    }
}

//#Preview {
//    RocketInformationView()
//}
