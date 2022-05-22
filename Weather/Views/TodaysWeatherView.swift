//
//  TodaysWeatherView.swift
//  Weather
//
//  Created by Aakash Sinha on 20/05/22.
//

import SwiftUI

struct TodaysWeatherView: View {
    
    @ObservedObject var cityVM =  CityWeatherViewModel()
   
    
    var body: some View {
        VStack(spacing: 10){
            Text("Today")
                .font(.largeTitle)
                .bold()
            HStack(spacing: 20){
                Image(systemName: "clouds.fill")
                VStack(alignment: .leading) {
                    Text("\(cityVM.getTemp(temp: cityVM.weather.current.temp))F" )
                        .font(.system(size: 42))
//                    Text("\(cityVM.weather.current.feelsLike)")
                }
            }
            
            HStack{
                Spacer()
                cardView(image: "wind", title: "\(cityVM.weather.current.windSpeed)mi/hr", color: .green)
                Spacer()
                cardView(image: "drop.fill", title: "\(cityVM.weather.current.humidity)", color: .blue)
                Spacer()
                cardView(image: "umbrella.fill", title: "\(cityVM.weather.current.dewPoint)" , color: .red)
                Spacer()
            }
        }
        .padding()
        .foregroundColor(.white)
        .background(RoundedRectangle(cornerRadius: 10).fill(LinearGradient(gradient: Gradient(colors: [Color.red.opacity(0.5), Color.red]), startPoint: .top, endPoint: .bottom)).opacity(0.3))
        .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: 2)
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 2, y: 2)
    }
    
    func cardView(image: String, title: String, color: Color) -> some View {
        
        VStack {
            Image(systemName: image)
                .padding()
                .font(.title)
                .foregroundColor(color)
                .background(RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white))
            
            Text(title)
        }
    }
}

struct TodaysWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        TodaysWeatherView()
    }
}
