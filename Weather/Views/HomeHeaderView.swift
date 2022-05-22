//
//  HomeHeaderView.swift
//  Weather
//
//  Created by Aakash Sinha on 20/05/22.
//

import SwiftUI

struct HomeHeaderView: View {
    @ObservedObject var cityVM =  CityWeatherViewModel()
    
    @State  var searchText = "London"
    var body: some View {
        HStack {
            TextField("", text: $searchText)
                .padding(.leading, 20)
                
            
            Button{
                
                cityVM.city = searchText
                
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.red)
                    Image(systemName: "location.fill")
                }
                
            }
            .frame(width: 50, height: 50)
        }
        .foregroundColor(.white)
        .padding()
        .background(ZStack(alignment: .leading) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white)
                .padding(.leading, 10)
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.red.opacity(0.5))
        }
        )
    }
}

struct HomeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeaderView()
    }
}
