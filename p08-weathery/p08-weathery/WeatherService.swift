//
//  WeatherService.swift
//  p08-weathery
//
//  Created by Vincent Zhou on 3/29/22.
//
import CoreLocation
import Foundation

public final class WeatherService: NSObject {
    private let locationManager = CLLocationManager()
    private let API_KEY = "c8ff71edac1f3b48659a0357c7725307"
    private var completionHandler: ((Weather) -> Void)?
    
    public override init() {
        super.init()
        locationManager.delegate = self
    }
    
    
    public func loadWeatherData(_ completionHandler: @escaping((Weather)-> Void)) {
        self.completionHandler = completionHandler
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    private func makeDataRequest(forCoordinates coordinates: CLLocationCoordinate2D) {
        guard let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&appid=\(API_KEY)&units=metric"
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else  {return}
        
        print(urlString)
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            print("URL get request")
            guard error == nil, let data = data else {return}
            print("URL get success")
            print(String(decoding: data, as: UTF8.self))
            if let response = try? JSONDecoder().decode(APIResponse.self, from: data) {
                print("Date requested")
                self.completionHandler?(Weather(response:response))
            }
        }.resume()
    }
}

extension WeatherService: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Update call")
        guard let location = locations.first else {return}
        print("Actual update")
        makeDataRequest(forCoordinates: location.coordinate)
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Something went wrong: \(error.localizedDescription)")
    }
}

struct APIResponse: Decodable {
    let name: String
    let main: APIMain
    let weather: [APIWeather]
}
struct APIMain: Decodable {
    let temp: Double
}
struct APIWeather: Decodable {
    let description: String
    let iconName: String
    
    enum CodingKeys: String, CodingKey {
        case description
        case iconName = "main"
    }
}
