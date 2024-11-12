//
//  WeatherService.swift
//  WeatherStatus
//
//  Created by Mdo Aoata on 6.10.2024.
//

import Foundation

// MARK: - WeatherService Protocol

protocol WeatherService {
    var weatherData: WeatherData? {get set}
    func fetchWeather(for city: String) async throws -> WeatherData
}

class WeatherServiceImpl: WeatherService {
    
    
    // TODO: add your API key from `https://api.openweathermap.org`
    // ...
    // "ADD_YOUR_API_KEY"
    private let apiKey = "d721ed36c6cf234374a40b9a3d4069c7"
    var weatherData: WeatherData?
    
    func fetchWeather(for city: String) async throws -> WeatherData {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
            
        } catch {
            throw NetworkError.dataDecodingError
        }
        return weatherData ?? .init(main: .init(temp: 0.0), weather: [.init(description: "")])
    }
    
    
}

enum NetworkError: Error, Equatable {
    case netowrkError(String)
    case dataDecodingError
}
