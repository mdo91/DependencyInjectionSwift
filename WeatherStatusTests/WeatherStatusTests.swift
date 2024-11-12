//
//  WeatherStatusTests.swift
//  WeatherStatusTests
//
//  Created by Mdo Aoata on 12.11.2024.
//

import XCTest
@testable import WeatherStatus
final class WeatherStatusTests: XCTestCase {
    
    var sut: weatherSeviceImpMock!
    
    
    override func setUp() {
         super.setUp()
         sut = weatherSeviceImpMock()
    }
    
    func testFailureWeatherStatus() async {
        sut.shouldThrowError = true
        do {
            let weatherData = try await sut.fetchWeather(for: "London")
        } catch let error {
            XCTAssertEqual(NetworkError.dataDecodingError, error as! NetworkError)
        }
        
    }

    
    
    class weatherSeviceImpMock: WeatherService {
        var weatherData: WeatherStatus.WeatherData?
        var shouldThrowError: Bool = false
        func fetchWeather(for city: String) async throws -> WeatherStatus.WeatherData {
            if shouldThrowError {
                throw NetworkError.dataDecodingError
            }
            return weatherData ?? .init(main: .init(temp: 0.0), weather: [.init(description: "")])
        }
    }

}
