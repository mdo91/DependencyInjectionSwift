//
//  WeatherViewModel.swift
//  WeatherStatus
//
//  Created by Mdo Aoata on 6.10.2024.
//

import Foundation

@MainActor
class WeatherViewModel: ObservableObject {
    
    @Published var temperature: String = ""
    @Published var description: String = ""
    @Published var isLoadingData: Bool = false
    
    @Injected private var fetchWeatherUseCase: FetchWeatherUseCase
    
    func loadWeather() async {
        isLoadingData = true
        do {
            let weather = try await fetchWeatherUseCase.execute(for: "London")
            self.temperature = "\(weather.temperature) C"
            self.description = weather.description.capitalized
            isLoadingData = false
        } catch {
            isLoadingData = false
            print("Error fetching weather \(error.localizedDescription)")
        }
    }
}
