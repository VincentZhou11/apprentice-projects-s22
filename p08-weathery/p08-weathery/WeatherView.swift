//
//  ContentView.swift
//  p08-weathery
//
//  Created by Vincent Zhou on 3/22/22.
//

import SwiftUI

struct WeatherView: View {
    
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.cityName).font(.largeTitle).padding()
            Text(viewModel.temperature).font(.system(size: 70)).bold()
            Text(viewModel.weatherIcon).font(.largeTitle).padding()
            Text(viewModel.weatherDescription)
        }.onAppear(perform: viewModel.refresh)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(viewModel: WeatherViewModel(weatherService: WeatherService()))
    }
}
