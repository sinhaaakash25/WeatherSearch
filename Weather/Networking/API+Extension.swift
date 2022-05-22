//
//  API+Extension.swift
//  Weather
//
//  Created by Aakash Sinha on 20/05/22.
//
//https://api.openweathermap.org/data/2.5/forecast?q=London&appid=a76e23a5e4a5da7426ad99d0ddbb81ca
import Foundation

extension API {
    static let baseURLString = "https://api.openweathermap.org/data/2.5"
    
    static func getURL(lat: Double, lon: Double) -> String {
        return "\(baseURLString)/onecall?lat=\(lat)&lon=\(lon)&appid=\(API.key)"
    }
}
