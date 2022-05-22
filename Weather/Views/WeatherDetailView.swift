//
//  WeatherDetailView.swift
//  Weather
//
//  Created by Aakash Sinha on 22/05/22.
//

import SwiftUI

struct WeatherDetailView: View {
    @ObservedObject var cityVm = CityWeatherViewModel()
    var weather: [WeatherDetail]
    
    var body: some View {
    
        ZStack {
            Color.red.opacity(0.5)
            VStack(spacing: 10){
                
                Text(cityVm.date)
                Text(weather.first!.main)
                    .font(.largeTitle)
                    .bold()
                HStack(spacing: 20){
                    Image(systemName: "clouds.fill")
                    VStack(alignment: .leading) {
                        Text(weather.first!.weatherDescription)

                    }
                }
            }
            .foregroundColor(.white)
            .padding()
            .foregroundColor(.white)
            .background(RoundedRectangle(cornerRadius: 10).fill(LinearGradient(gradient: Gradient(colors: [Color.red.opacity(0.5), Color.red]), startPoint: .top, endPoint: .bottom)).opacity(0.3))
            .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: 2)
            .shadow(color: Color.black.opacity(0.2), radius: 2, x: 2, y: 2)
            
        }
        .edgesIgnoringSafeArea(.all)
        
        }
        
}



