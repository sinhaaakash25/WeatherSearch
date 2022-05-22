//
//  CityWeatherViewModel.swift
//  Weather
//
//  Created by Aakash Sinha on 20/05/22.
//

import Foundation
import CoreLocation

final class CityWeatherViewModel: ObservableObject {

    @Published var weather = WeatherModel.empty()
    @Published var showAlert = false
    
    @Published var city: String = "London" {
        didSet {
            getLocation()
            
        }
    }
    init() {
        getLocation()
    }
    
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
    
    lazy var dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter
    }()
    
    lazy var timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh a"
        return formatter
    }()
    
    var date: String {
        return dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.current.dt)))
    }
    var weatherIcon: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].icon
        }
        return "sun.max.fill"
    }
    
    var weatherConditions: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].main
        }
        return ""
    }
    
    var temperature: String {
        return getTemp(temp: weather.current.temp)
    }
    
    var windSpeed: String {
        return String(format: "%0.1f", weather.current.windSpeed)
    }
    
    var humidity: String {
        return String(format: "%d%%", weather.current.humidity)
    }
    
    var rainChances: String {
        return String(format: "%0.0f", weather.current.dewPoint)
    }
    
    func getTemp(temp: Double) -> String {
        return String(format: "%0.1f", temp)
    }
    
    func getDay(timestamp: Int) -> String {
        return dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
    }
    
    func getLocation() {
        CLGeocoder().geocodeAddressString(city) { (placemarks, error) in
            if let places = placemarks, let place = places.first {
            
                self.getWeatherUsingCoordinates(coord: place.location?.coordinate)
            }
            if placemarks == nil {
                self.showAlert = true
                //self.city = ""
                self.weather = WeatherModel.empty()
            }
            else {
                self.showAlert = false
                
            }
        }
    }
    
    
    func getWeatherUsingCoordinates(coord: CLLocationCoordinate2D?) {
        if let coord = coord {
            let urlString = API.getURL(lat: coord.latitude, lon: coord.longitude)
            getWeather(cityName: city, for: urlString)
        }
        else {
            let urlString = API.getURL(lat: 37.64, lon: -121.45)
            getWeather(cityName: city, for: urlString)
        }
    }
    
    func getWeather(cityName: String, for urlString: String) {
        NetworkManager<WeatherModel>.fetchWeather(for: URL(string: urlString)!) { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.weather = response
                    print(self.weather)
                    
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
}
