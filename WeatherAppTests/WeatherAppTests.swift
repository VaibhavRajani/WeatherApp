//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by Vaibhav Rajani on 1/28/24.
//

import XCTest
@testable import WeatherApp

class WeatherAppTests: XCTestCase {
    
    var viewModel: WeatherViewModel!
    var mockWeatherService: MockWeatherService!
    
    override func setUp() {
        super.setUp()
        mockWeatherService = MockWeatherService()
        viewModel = WeatherViewModel(weatherService: mockWeatherService)
    }
    
    override func tearDown() {
        viewModel = nil
        mockWeatherService = nil
        super.tearDown()
    }
    
    func testSearch() {
        let expectation = self.expectation(description: "Fetching weather data")
        
        viewModel.search(city: "TestCity")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 3) { error in
            if error != nil {
                XCTFail("waitForExpectationsWithTimeout errored: \(error!)")
            }
            
            XCTAssertTrue(self.viewModel.hasFetchedForecasts)
            XCTAssertEqual(self.viewModel.forecasts.count, 1)
        }
    }
}

class MockWeatherService: WeatherServiceProtocol {
    func fetchWeather(for city: String, completion: @escaping (ForecastResponse?) -> Void) {
        // Mock response with expected data structure
        let mockForecast = Forecast(dt: 0, main: Main(temp: 20, feels_like: 20), weather: [Weather(main: "Clear", description: "clear sky")])
        let mockForecastResponse = ForecastResponse(list: [mockForecast])
        completion(mockForecastResponse)
    }
}
