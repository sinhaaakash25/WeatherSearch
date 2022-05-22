//
//  DailyWeather.swift
//  Weather
//
//  Created by Aakash Sinha on 21/05/22.
//

import SwiftUI

struct DailyWeatherView: View {
    @ObservedObject var cityVM =  CityWeatherViewModel()
    
    var body: some View {
       
            VStack {
                ForEach(cityVM.weather.daily) { weather in
                    dailyCell(weather: weather)
                }
            }
        
    }
    
    func dailyCell(weather: DailyWeather ) -> some View {
        NavigationLink(destination: WeatherDetailView(weather: weather.weather)) {
            HStack {
                Text(cityVM.getDay(timestamp: weather.dt).uppercased())
                    .frame(width: 150)
                Spacer()
                Text("\(cityVM.getTemp(temp: weather.temp.min)) | \(cityVM.getTemp(temp: weather.temp.max))")
                    .frame(width: 150)
            }
        }
        .foregroundColor(.white)
        .padding(.horizontal, 40 )
        .padding(.vertical, 15)
        .background(RoundedRectangle(cornerRadius: 10).fill(LinearGradient(gradient: Gradient(colors: [Color.red.opacity(0.5), Color.red]), startPoint: .top, endPoint: .bottom)).opacity(0.3))
        .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: 2)
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 2, y: 2)
    }
    
}

struct DailyWeather_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherView()
    }
}
