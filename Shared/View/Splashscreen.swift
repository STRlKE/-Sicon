//
//  SplashScreen.swift
//  DisneySplashScreen (iOS)
//
//  Created by 하명관 on 2022/03/22.
//

import SwiftUI

struct SplashScreen: View {
    
    // Animation Properties
    @State var startAnimation = false // 애니메이션 시작 할때 쓰이는 내부 함수 보우 애니메이션과 다르게 스타트애니메이션은 남아있지가않음. 물어볼것
    @State var bowAnimation = false // 보우애니메이션과 스타트애니메이션의 차이를 어디서 정했는지 모르겠음
    
    // Glow Animation...
    @State var glow = false // 반짝이게 하는 함수
    
    // 이미지 추가
    @State var showPlus = false // 플러스 보여주고
    @State var plusBGGlow = false // 플러스 뒤에 반짝이
    
    @State var isFished = false // 스플래쉬 화면 끝날때 다른 화면으로 넘어가기
    
    var body: some View {
        
        // for safety
        HStack{
            
            if !isFished{ // isFinshed가 거짓일때 실행
                
                ZStack{ // x , y , z 중 z에 위치
                    
                    Color("BG") // 저장해준 배경색 가져오기
                        .ignoresSafeArea() // 아랫부분과 윗부분 모두 지정해주기
                    
                    // Disney Logo
                    GeometryReader{proxy in // GeometryReader는 크게설명하면 하위뷰들의 위치와 모양을 정보를 알려주고 설정하는걸 도움. https://protocorn93.github.io/2020/07/26/GeometryReader-in-SwiftUI/
                        //솔직히 20분넘게 서칭했는데 proxy in은 언제 사용하는지 감도못찾음
                        
                        // For Screen Size
                        let size = proxy.size//아마여기서 size 정보를 제안받는데 쓰는듯 GeometryReader사용
                        
                        ZStack{
                            
                            //RainBow..
                            Circle() // 원만듬
                            // Trimming
                                .trim(from: 0, to: bowAnimation ? 0.5 : 0) //from 시작값 , to는 끝값 trim은 일부만 나타나게할수있다 true면 0.5 거짓이면 0
                                .stroke( // 원을 선으로 만들어주는것
                                    
                                    // Gradient.. 그라디언트 색깔 그라데이션효과
                                    .linearGradient(.init(colors: [ //선형 그레이더는 축을 따라 그라디언트 기능을 가지고 있으며 색 공간, 시작 및 끝점을 사용자 정의 할 수 있습니다.
                                        
                                        Color("Gradient1"),
                                        Color("Gradient2"),
                                        Color("Gradient3"),
                                        Color("Gradient5"),
                                        Color("Gradient5").opacity(0.5),
                                        Color("BG"),
                                        Color("BG"),
                                        
                                                                  ]), startPoint: .leading, endPoint: .trailing) // 시작점은 왼쪽에서 오른쪽으로
                                    ,style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round) // stroke스타일설정
                                )
                                .overlay( //
                                    
                                    // Glow Circle...  반짝이는 원
                                    Circle() // 선의 시작점을 나타내는원
                                        .fill(Color.white.opacity(0.4)) // 투명도 0.4 흰색
                                        .frame(width: 6, height: 6) // 넓이 높이 지정
                                        .overlay(
                                            
                                            Circle() // 그 원에 중첩하여 반짝이게만듬
                                                .fill(Color.white.opacity(glow ? 0.5 : 0.1)) // glow 함수가 트루일떄 밝기 가 .5 아니면 .1
                                                .frame(width: 20, height: 20)
                                            
                                        )
                                        .blur(radius: 2.5) // 불투명처리 블러 철
                                    // Moving towards left..
                                        .offset(x: (size.width / 2) / 2) //원이 어디 위치해야 되는지 설정
                                    // moving towards bow..
                                        .rotationEffect(.init(degrees: bowAnimation ? 180 : 0)) // 180도만 회전시키는것 반짝이는원을
                                        .opacity(startAnimation ? 1 : 0) // Start를 사용하면 끝에 와서 사라지고 보우를 사용하면 계속남아있음 차이점을 모름
                                )
                                .frame(width: size.width / 1.9, height: size.width / 2) //크기
                                .rotationEffect(.init(degrees: -200)) // stroke와 원들 모두 몇도를 회전할것인지 설정 -
                                .offset(y:10) // y 축 지정
                            
                            HStack(spacing: -20 ){//Hstack 가로끼리 프레임 지정 x축
                                
                                Image("Sicon") // asset파일에 저장한 이미지를 불러옴
                                    .renderingMode(.template)//template - 이미지의 불투명 영역이  가진 본래의 색 무시하고 원하는 색으로 변경해 템플릿 이미지로 활용
                                    .resizable() //적당한 크기로 변경
                                    .aspectRatio(contentMode: .fit) //마찬가지로 크기변경
                                    .frame(width: size.width / 1.9,
                                           height: size.width / 1.9
) // 넓이와 높이 사이즈조정
                                    .opacity(bowAnimation ? 1 : 0)
                                
                                Image("plus") // 플러스 이미지 지정
                                    .renderingMode(.template)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80, height: 80)
                                // 백그라운드 불빛
                                    .background(
                                        
                                        ZStack{
                                            
                                            Circle() // 플러스가 반짝이게 만들어줌
                                                .fill(Color.white.opacity(0.25))
                                                .frame(width: 35, height: 35)
                                                .blur(radius:  2)
                                        }
                                            .opacity(plusBGGlow ? 1 : 0) // plusBGGlow가 트루이면 투명도1 아니면 투명도0
                                    )
                                    .scaleEffect(showPlus ? 1 : 0) // 쇼플러스가 트루면 플러스이미지크기가 1 아니면 0 없어짐
                                
                                
                                
                                
                            }
                            .foregroundColor(.white ) //색깔변경
                            
                        }
                        
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        //zstack의 위치조정
                        
                    }
                }
                .onAppear { //View 가 나타날 때  실행될 acttion을 추가 특정항목을 나타낼수가있음.
                    
                    // Delaying 0.3second 디스페치를 사용하면 onappear로 불러오는것을 지연시킬수있음.
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3)
                    {
                        
                        withAnimation(.linear(duration: 2)){
                            bowAnimation.toggle()
                            // duration :선이 그려지는시간 2초로 지정 withAnimation을 사용하면 모든 코드에 영향을줌 .linear은 일정한속도
                            
                        }
                        
                        // Glow Animation 반짝이는 애니메이션
                        withAnimation(.linear(duration: 0.5).repeatForever(autoreverses: true)){
                            glow.toggle()
                            // withAnimation:모든 glow에 적용 .linear: 일정한속도, duration: 0.5초동안 반짝거리기 . repeatforever(autoreverses:true)끝없이 반복
                            
                        }
                        // Since we dont need glow from bottom of disney so delaying animation
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            
                            withAnimation(.spring()){
                                startAnimation.toggle()
                                // 스프링처럼 보여줬다가 안보여줬다
                            }
                        }
                        
                        // 플러스 이미지가 나오기전에 불빛 숨기기
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            
                            withAnimation(.spring()){
                                showPlus.toggle()
                                startAnimation.toggle()
                            }
                        }
                        
                        // 플러스이미지를 치면 빛나게 하기
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.7) {
                            
                            withAnimation(.spring()){
                                plusBGGlow.toggle()
                            }
                            
                            // 1.0초 뒤에 toggle 시켜주기 // 종료 시켜줌
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                
                                withAnimation(.linear(duration: 1.0)){
                                    plusBGGlow.toggle()
                                }
                                
                                // 2.5초 이후에 스플래쉬 화면을 끝내기
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                                    
                                    withAnimation {
                                        isFished.toggle()
                                    }
                                }
                                
                            }
                        }
                    }
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
