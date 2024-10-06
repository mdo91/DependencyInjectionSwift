//
//  WeatherView.swift
//  WeatherStatus
//
//  Created by Mdo Aoata on 6.10.2024.
//

import SwiftUI

struct WeatherView: View {
    
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        VStack(spacing: 2) {
            if viewModel.isLoadingData {
                ProgressView()
            } else {
                Text("Weather Status".uppercased())
                    .font(.caption2)
                    .bold()
                    .padding()
                HStack(spacing: 2) {
                    
                    Text("London".uppercased())
                        .font(.callout)
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                    
                    Text(viewModel.temperature)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                    
                    Text(viewModel.description)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                }
                Spacer()
            }
        }
        .task {
            await viewModel.loadWeather()
        }
        .background(
        Image("sky")
        )
    }
}

#Preview {
    WeatherView()
}
