//
//  p08_weatheryApp.swift
//  p08-weathery
//
//  Created by Vincent Zhou on 3/22/22.
//

import SwiftUI

@main
struct p08_weatheryApp: App {
    var body: some Scene {
        WindowGroup {
            let weatherService = WeatherService()
            let viewModel = WeatherViewModel(weatherService: weatherService)
            WeatherView(viewModel: viewModel)
        }
    }
}
