//
//  ContentView.swift
//  Shared
//
//  Created by 이득령 on 2022/09/05.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        
        ZStack{
            backgroundView(isNight: $isNight)
            VStack(spacing: 20){
                CityName(title: "인천")

                MainWeatherIconView(ImageName: isNight ? "moon.stars.fill" : "sun.max.fill", temperature: isNight ? 5 : 23)
                
                Spacer()
                
                HStack {
                    WeatherInfo(dayOfWeek:"월" , ImageName: "sun.max.fill", temperature: 15)
                    WeatherInfo(dayOfWeek:"화" , ImageName: "sun.max.fill", temperature: 15)
                    WeatherInfo(dayOfWeek:"수" , ImageName: "sun.max.fill", temperature: 15)
                    WeatherInfo(dayOfWeek:"목" , ImageName: "sun.max.fill", temperature: 15)
                    WeatherInfo(dayOfWeek:"금" , ImageName: "sun.max.fill", temperature: 15)
                }
                
                Button {
                    self.isNight.toggle()
                } label: {
                    WeatherButton(title: isNight ? "라이트모드로 전환" : "다크모드로 전환", backGroundColor: isNight ? .gray : .white, textColor: isNight ? .white : .blue)

                }

                
                Spacer()
                
            }
            .padding()
            
    
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherInfo: View {
    
    var dayOfWeek: String
    var ImageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(.white)
                .padding()
            
            Image(systemName: ImageName)
                .resizable()
                .renderingMode(.original)
                .frame(width: 50, height: 50)
                .aspectRatio(contentMode: .fit)
            
            Text("\(temperature)")
                .font(.system(size: 20))
                .foregroundColor(.white)
        }
    }
    
}

struct backgroundView: View {
  
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : .white]), startPoint: .topTrailing, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityName: View {
    
    var title: String
    
    var body: some View {
        
        Text(title)
            .font(.system(size: 30))
            .foregroundColor(.white)
            .fontWeight(.heavy)
        
    }
}

struct MainWeatherIconView: View {
    
    var ImageName: String
    var temperature: Int
    
    var body: some View {
        
        Image(systemName:ImageName)
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 180, height: 180)
                    .aspectRatio(contentMode: .fit)
                
                Text("\(temperature)°")
                    .font(.system(size: 70))
                    .foregroundColor(.white)
    }
}

struct WeatherButton: View {
    var title: String
    var backGroundColor: Color
    var textColor: Color
    
    var body: some View {
        Text(title)
            .font(.system(size: 20))
            .bold()
            .frame(width: 300, height: 70)
            .background(backGroundColor)
            .foregroundColor(textColor)
            .cornerRadius(20)
    }
}
