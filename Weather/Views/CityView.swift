//
//  CityView.swift
//  Weather
//
//  Created by Aakash Sinha on 21/05/22.
//

import SwiftUI

struct CityView: View {
    @ObservedObject var cityVM =  CityWeatherViewModel()
    
    var body: some View {
        VStack {
            
            TodaysWeatherView(cityVM: cityVM)
                .padding()
            DailyWeatherView(cityVM: cityVM)
                
        }
        
        .padding(.bottom, 30)
        
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        CityView()
    }
}
