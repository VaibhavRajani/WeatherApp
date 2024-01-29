//
//  SearchView.swift
//  WeatherApp
//
//  Created by Vaibhav Rajani on 1/28/24.
//

import Foundation
import SwiftUI

struct SearchView: View {
    @State private var city: String = ""
    @StateObject var viewModel = WeatherViewModel()
    
    var body: some View {
        VStack {
            TextField("City Name", text: $city)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            NavigationLink(destination: ListView(forecasts: viewModel.forecasts), isActive: $viewModel.hasFetchedForecasts) {
                Button(action: {
                    viewModel.search(city: city)
                    city = ""
                }) {
                    Text("Lookup")
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 1)
                        )
                }
                .padding([.leading, .trailing], 20)
            }
        }
        .navigationTitle("City Name")
    }
}


