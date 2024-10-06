//
//  WeatherRepository.swift
//  WeatherStatus
//
//  Created by Mdo Aoata on 6.10.2024.
//

import Foundation

// MARK: - WeatherRepository Protocol (Data Layer)

protocol WeatherRepository {
    func getWeather(for city: String) async throws -> Weather
}

// MARK: - WeatherRepository Implementation

class WeatherRepositoryImpl: WeatherRepository {

    // dependency injection
    @Injected private var weatherService: WeatherService
    
    func getWeather(for city: String) async throws -> Weather {
        let weatherData = try await weatherService.fetchWeather(for: city)
        
        return Weather(temperature: weatherData.main.temp, description: weatherData.weather.first?.description ?? "N/A")
    }
}
