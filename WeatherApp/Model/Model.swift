//
//  Model.swift
//  WeatherApp
//
//  Created by Vaibhav Rajani on 1/28/24.
//

import Foundation

struct ForecastResponse: Codable {
    let list: [Forecast]
}

struct Forecast: Codable, Identifiable {
    let dt: Int
    let main: Main
    let weather: [Weather]
    var id: Int { dt }
}

struct Main: Codable {
    let temp: Double
    let feels_like: Double
}

struct Weather: Codable {
    let main: String
    let description: String
}
