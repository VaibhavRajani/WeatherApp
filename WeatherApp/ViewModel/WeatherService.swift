//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Vaibhav Rajani on 1/28/24.
//

import Foundation

protocol WeatherServiceProtocol {
    func fetchWeather(for city: String, completion: @escaping (ForecastResponse?) -> Void)
}

class WeatherService:WeatherServiceProtocol {
    func fetchWeather(for city: String, completion: @escaping (ForecastResponse?) -> Void) {
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=65d00499677e59496ca2f318eb68c049&units=metric"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let forecastResponse = try? JSONDecoder().decode(ForecastResponse.self, from: data)
            DispatchQueue.main.async {
                completion(forecastResponse)
            }
        }.resume()
    }
}
