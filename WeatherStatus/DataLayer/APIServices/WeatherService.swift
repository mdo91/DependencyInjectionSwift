//
//  WeatherService.swift
//  WeatherStatus
//
//  Created by Mdo Aoata on 6.10.2024.
//

import Foundation

// MARK: - WeatherService Protocol

protocol WeatherService {
    func fetchWeather(for city: String) async throws -> WeatherData
}

class WeatherServiceImpl: WeatherService {
    
    
    // TODO: add your API key from `https://api.openweathermap.org`
    // ...
    // "ADD_YOUR_API_KEY"
    private let apiKey = "ADD_YOUR_API_KEY"
    
    func fetchWeather(for city: String) async throws -> WeatherData {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(WeatherData.self, from: data)
    }
    
    
}
