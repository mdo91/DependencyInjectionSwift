//
//  WeatherStatusApp.swift
//  WeatherStatus
//
//  Created by Mdo Aoata on 6.10.2024.
//

import SwiftUI

@main
struct WeatherStatusApp: App {
    init() {
        // register WeatherService
        
        DependencyInjectionContainer.shared.register(WeatherServiceImpl(), for: WeatherService.self)
        // register WeatherRepo
        DependencyInjectionContainer.shared.register(WeatherRepositoryImpl(), for: WeatherRepository.self)
        // register Weather UseCase
        DependencyInjectionContainer.shared.register(FetchWeatherUseCaseImpl(), for: FetchWeatherUseCase.self)
    }
    var body: some Scene {
        WindowGroup {
            WeatherView()
        }
    }
}
