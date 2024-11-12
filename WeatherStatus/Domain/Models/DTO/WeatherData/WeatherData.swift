//
//  WeatherData.swift
//  WeatherStatus
//
//  Created by Mdo Aoata on 6.10.2024.
//

import Foundation

// MARK: - WeatherData DTO (Data Transfer Object)

struct WeatherData: Codable {
    let main: Main
    let weather: [Weather]
    
    struct Main: Codable {
        let temp: Double
    }
    struct Weather: Codable {
        let description: String
    }
}
