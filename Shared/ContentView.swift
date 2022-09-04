//
//  ContentView.swift
//  Shared
//
//  Created by vasu  on 04/09/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: $isNight)
            
            VStack{
                
                CityTextView(cityName: "Las Vegas, CA")
                MainWheatherStatus(imageName: isNight ? "moon.stars.fill": "cloud.sun.fill", temprature: "25")
                .padding(.bottom, 40)
                
                HStack(spacing: 20){
                    WheatherDayView(dayOfWeek: "Mon", imageName: "cloud.sun.fill", temprature: 16)
                    
                    WheatherDayView(dayOfWeek: "Tue", imageName: "cloud.fog.fill", temprature: 8)
                    
                    WheatherDayView(dayOfWeek: "Wed", imageName: "wind.snow", temprature: 0)
                    
                    WheatherDayView(dayOfWeek: "Thu", imageName: "cloud.rain.fill", temprature: 2)
                    
                    WheatherDayView(dayOfWeek: "Fri", imageName: "snow", temprature: -3)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    ButtonWheather(title: "Change the Day", background: .white, text: .blue)          }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}

struct WheatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temprature: Int
    
    var body: some View {
        VStack{
            Text("\(dayOfWeek)")
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: "\(imageName)")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temprature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black: .blue, isNight ? .gray: .cyan]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWheatherStatus: View {
    var imageName: String
    var temprature: String
    
    var body: some View {
        VStack(spacing: 8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temprature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
    }
}
