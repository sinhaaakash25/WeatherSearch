//
//  WeatherModel.swift
//  Weather
//
//  Created by Aakash Sinha on 21/05/22.
//


import Foundation

// MARK: - Welcome
struct WeatherModel: Codable {
    var current: Weather
    var hourly: [Weather]
    var daily: [DailyWeather]

    enum CodingKeys: String, CodingKey {
        case current, hourly, daily
    }
    
    static func empty() -> WeatherModel {
        return WeatherModel(current: Weather(), hourly: [Weather](repeating: Weather(),count: 23), daily: [DailyWeather](repeating: DailyWeather(), count: 8))
    }
}

// MARK: - Current
struct Weather: Codable, Identifiable {
    var dt: Int
    var temp, feelsLike: Double
    var pressure, humidity: Int
    var dewPoint: Double
    var clouds: Int
    var windSpeed: Double
    var windDeg: Int
    var weather: [WeatherDetail]

    enum CodingKeys: String, CodingKey {
        case dt, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case clouds
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather
    }
    
    init() {
        dt = 0
        temp = 0.0
        feelsLike = 0.0
        pressure = 0
        humidity = 0
        dewPoint = 0.0
        clouds = 0
        windSpeed = 0.0
        windDeg = 0
        weather = []
    }
}
extension Weather {
    var id: UUID {
        return UUID()
    }
}


// MARK: - Weather
struct WeatherDetail: Codable {
    var main: String
    var weatherDescription: String
    var icon: String

    enum CodingKeys: String, CodingKey {
        case main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Daily
struct DailyWeather: Codable, Identifiable {
    var dt: Int
    var temp: Temp
    var weather: [WeatherDetail]
    

    enum CodingKeys: String, CodingKey {
        case dt
        case temp
        case weather
    }
    
    init() {
        dt = 0
        temp = Temp(min: 0.0, max: 0.0)
        weather = [WeatherDetail(main: "", weatherDescription: "", icon: "")]
    }
}

extension DailyWeather {
    var id: UUID {
        return UUID()
    }
}

// MARK: - FeelsLike
//struct FeelsLike: Codable {
//    var day, night, eve, morn: Double
//}

// MARK: - Temp
struct Temp: Codable {
    var min: Double
    var max: Double
    
}


