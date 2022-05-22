//
//  ContentView.swift
//  Weather
//
//  Created by Aakash Sinha on 20/05/22.
//

import SwiftUI

struct ContentView: View {

    var alert: Alert {
            Alert(title: Text("Oops"), message: Text("City Not Found"), dismissButton: .default(Text("Dismiss")))
        }
    
    @ObservedObject var cityVM =  CityWeatherViewModel()
    
    var body: some View {
        NavigationView {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                HomeHeaderView(cityVM: cityVM)
                
                    ScrollView( showsIndicators: false) {
                        CityView(cityVM: cityVM)
                            .opacity(cityVM.showAlert ? 0 : 1)
                    
                }
                    .alert(isPresented: $cityVM.showAlert, content: { self.alert })
                }
            .padding(.top, 40)
        }
        .navigationBarHidden(true)
        .navigationTitle(cityVM.city)
        .background(RoundedRectangle(cornerRadius: 10).fill(LinearGradient(gradient: Gradient(colors: [Color.red.opacity(0.8), Color.red]), startPoint: .top, endPoint: .bottom)).opacity(0.7))
        .edgesIgnoringSafeArea(.all)
                    
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
