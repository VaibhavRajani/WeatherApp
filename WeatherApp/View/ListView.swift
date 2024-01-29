//
//  ListView.swift
//  WeatherApp
//
//  Created by Vaibhav Rajani on 1/28/24.
//

import Foundation
import SwiftUI

struct ListView: View {
    var forecasts: [Forecast]

    var body: some View {
        List(forecasts) { forecast in
            NavigationLink(destination: DetailView(forecast: forecast)) {
                HStack {
                    Text(forecast.weather.first?.main ?? "")
                    Spacer()
                    Text("\(forecast.main.temp, specifier: "%.0f")°")
                }
                .padding()
            }
        }
        .navigationTitle("Forecasts")
    }
}


