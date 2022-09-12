//
//  ContentView.swift
//  WeatherApp
//
//  Created by Adam Gerber on 9/10/22.
//

import SwiftUI


struct ContentView: View {
    
    //MARK: PROPERTIES
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack{
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherView(icon: isNight ? "moon.stars.fill" : "cloud.sun.fill", temp: 76)
                
                
                HStack(spacing: 20){
                    DayView(day: "MON", image: "cloud.sun.fill", temp: 76)
                    DayView(day: "TUE", image: "sun.max.fill", temp: 80)
                    DayView(day: "WED", image: "cloud.sun.fill", temp: 65)
                    DayView(day: "THU", image: "wind", temp: 80)
                    DayView(day: "FRI", image: "sun.max.fill", temp: 79)
                }
                Spacer()
                
                Button(action: {
                    isNight.toggle()
                }) {
                    WeatherButton(title: "Change Day Time", textColor: Color.blue, backgroundColor: .white)
                }
                .padding(.bottom, 100)
                Spacer()
            }//:VSTACK
        }//:ZSTACK
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DayView: View {
    
    var day: String
    var image:  String
    var temp: Int
    
    var body: some View {
        VStack(spacing:10){
            Text(day)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temp)°")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
            Spacer()
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct CityTextView: View {
    
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32,weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherView: View {
    
    var icon: String
    var temp: Int
    
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: icon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temp)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

