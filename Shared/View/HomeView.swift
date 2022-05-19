//
//  HomeView.swift
//  Sicon (iOS)
//
//  Created by 하명관 on 2022/05/19.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationView{
            
            
                
                ZStack{
                    Color("Color-1")
                        .ignoresSafeArea()
                    
                    
                    VStack{
                        Rectangle()
                            .fill(Color("Color"))
                            .frame(width: 380.0, height: 380.0)
                            .cornerRadius(90)
                            .padding(.bottom, 400)
                    }
                    
                    Text("안녕하세요 SIcon님 기분좋은 하루입니다.")
                        .foregroundColor(.white)
                        .font(.system(size:30))
                        .kerning(1)
                        .font(.largeTitle)
                        .bold()
                        .padding(.top,30)
                        .padding(.bottom,650)
                        .frame(width:350)
                    
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 330.0, height: 120.0)
                        .cornerRadius(45)
                        .padding(.bottom,200)
                        .shadow(color: .gray, radius: 2, y: 3)
                    
                    Text("최근 서비스 이용 내역")
                        .font(.system(size:20))
                        .kerning(1)
                        .font(.largeTitle)
                        .bold()
                        .padding(.top,30)
                        .padding(.trailing,150)

                    HStack{
                        Text("오늘의 기분을 영상을 찍어 전달해 보는것은 어떨까요?")
                            .font(.system(size: 17))
                            .bold()
                            .kerning(1)
                            .padding(.bottom, 190)
                            .frame(width:200)
                        
                        
                        NavigationLink(destination: Home()) {
                            Image("Reels")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.black)
                            
                                .padding(12)
                                .frame(width: 60, height: 60)
                                .padding(.bottom,190)
                        }
                    }
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 380.0, height: 160.0)
                        .cornerRadius(45)
                        .padding(.top,250)
                        .shadow(color: .gray, radius: 2, y: 3)
                    
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 380.0, height: 160.0)
                        .cornerRadius(45)
                        .padding(.top,600)
                        .shadow(color: .gray, radius: 2, y: 3)
                    
                    
                    
                    
                    
                    
                    
                }
            }
        .overlay(SplashScreen())
        
        }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
