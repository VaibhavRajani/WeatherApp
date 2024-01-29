//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Vaibhav Rajani on 1/28/24.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var forecasts: [Forecast] = []
    @Published var hasFetchedForecasts: Bool = false
    private var weatherService: WeatherServiceProtocol
    
    init(weatherService: WeatherServiceProtocol = WeatherService()) {
        self.weatherService = weatherService
    }
    
    func search(city: String) {
        weatherService.fetchWeather(for: city) { [weak self] response in
            if let forecasts = response?.list {
                self?.forecasts = forecasts
                self?.hasFetchedForecasts = true
            }
        }
    }
}


