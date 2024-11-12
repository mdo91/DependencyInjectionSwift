//
//  WeatherUseCases.swift
//  WeatherStatus
//
//  Created by Mdo Aoata on 6.10.2024.
//

import Foundation

// MARK: - FetchWeatherUseCase Protocol (Interactor Layer)

protocol FetchWeatherUseCase {
    func execute(for city: String) async throws -> Weather
}

// MARK: - FetchWeatherUseCase Implementation
class FetchWeatherUseCaseImpl: FetchWeatherUseCase {
    
    @Injected private var weatherRepository: WeatherRepository
    
    func execute(for city: String) async throws -> Weather {
        return try await weatherRepository.getWeather(for: city)
    }
    
}
