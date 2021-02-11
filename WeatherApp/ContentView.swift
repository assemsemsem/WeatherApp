//
//  ContentView.swift
//  WeatherApp
//
//  Created by Assem on 2/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: isNight ? .black : .blue, bottomColor: isNight ? .gray : .white)
            VStack {
                Text("Atyrau, Kazakhstan")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding(.bottom, 40)
                
                VStack(spacing: 8) {
                    Image(systemName: isNight ? "cloud.moon.fill" : "wind")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    
                    Text("8°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 50)
                
                HStack(spacing: 30) {
                    WeatherDayView(day: "TUE", imageName: "cloud.sun.fill", temp: 6)
                    WeatherDayView(day: "WED", imageName: "wind.snow", temp: 3)
                    WeatherDayView(day: "THU", imageName: "snow", temp: 3)
                    WeatherDayView(day: "FRI", imageName: "wind.snow", temp: 2)
                    WeatherDayView(day: "SAT", imageName: "cloud.sun.fill", temp: 7)
                }
                Spacer()

                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: isNight ? "Change Day Time" : "Change Night Time", textColor: .blue, backgroundColor: .white )
                }
                .padding(.bottom, 80)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var day: String
    var imageName: String
    var temp: Int
    var body: some View {
        VStack {
            Text(day)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temp)°")
                .font(.system(size: 45, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
