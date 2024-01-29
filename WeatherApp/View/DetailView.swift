//
//  DetailView.swift
//  WeatherApp
//
//  Created by Vaibhav Rajani on 1/28/24.
//

import Foundation
import SwiftUI

struct DetailView: View {
    let forecast: Forecast

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("\(forecast.main.temp, specifier: "%.0f")°")
                .font(.system(size: 70))
                .frame(maxWidth: .infinity, alignment: .center)
            
            Text("Feels Like: \(forecast.main.feels_like, specifier: "%.0f")°")
                .frame(maxWidth: .infinity, alignment: .trailing)
                .font(.title3)
            
            Text(forecast.weather.first?.main ?? "")
                .font(.title)
            
            Text(forecast.weather.first?.description ?? "")
                .font(.title3)
            Spacer()
        }
        .padding()
        .navigationBarTitle("Details", displayMode: .inline)
    }
}


