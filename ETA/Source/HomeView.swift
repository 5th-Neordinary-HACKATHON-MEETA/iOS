//
//  HomeView.swift
//  ETA
//
//  Created by 윤지성 on 11/25/23.
//

import SwiftUI

struct HomeView: View {
    @State private var showSheet = false
    @State private var showAlert = false
    @State private var showTimeSheet = false


    @State private var showNavLinkOne = false

    let rows = [GridItem(.flexible())]
    let colors: [Color] = [.black, .blue, .brown, .cyan, .gray, .indigo, .mint, .yellow, .orange, .purple]
    var body: some View {
        NavigationView {
            VStack{
                VStack{
                    ZStack{
                        VStack{
                            VStack(alignment: .leading){
                                HStack{
                                    Spacer()
                                    Button(action: {}, label: {
                                        Image("Bell").resizable().frame(width: 24, height: 28).padding(.trailing, 16)
                                    })
                                }
                                HStack{
                                    Text("ETA와 함께하는\n즐거운 회의 시간 :)")
                                        .font(
                                            Font.custom("Pretendard Variable", size: 24)
                                                .weight(.bold)
                                        )
                                        .kerning(0.024)
                                        .foregroundColor(.white).padding(.bottom, 83).padding(.leading, 26)
                                    Spacer()
                                    
                                    Image("LogoGrey").padding(.trailing, 0)
                                }.frame(width: .infinity, height: 150)
                                Spacer()
                                
                                
                            }.foregroundColor(.clear)
                                .frame(width: 393, height: 298)
                                .background(
                                    LinearGradient(
                                        stops: [
                                            Gradient.Stop(color: Color(red: 1, green: 0.44, blue: 0.07), location: 0.00),
                                            Gradient.Stop(color: Color(red: 1, green: 0.72, blue: 0), location: 1.00),
                                        ],
                                        startPoint: UnitPoint(x: 0.35, y: 0.72),
                                        endPoint: UnitPoint(x: 1.13, y: -0.57)
                                    )
                                ).frame(height: 290)
                        }
                        CollectionViewCell().offset(y: 100)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 27, height: 6)
                            .background(Color(red: 1, green: 0.44, blue: 0.07))
                            .cornerRadius(30).offset(y: 200)
                        
                    }
                    Button(action: {
                        showSheet.toggle()
                    }, label: {
                        HStack{
                            // H1
                            Text("팀 생성하기")
                                .font(
                                    Font.custom("Pretendard Variable", size: 20)
                                        .weight(.bold)
                                )
                                .kerning(0.02)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 1, green: 0.44, blue: 0.07)).padding(.trailing, 48).padding(.leading, 26)
                            
                            Image("Arrow").padding(.trailing, 34)
                        }.foregroundColor(.clear)
                            .frame(width: 360, height: 90)
                            .background(.white)
                            .cornerRadius(20)
                            .shadow(color: Color(red: 0.2, green: 0.12, blue: 0.06).opacity(0.1), radius: 10, x: 5, y: 3)
                            .padding(.bottom, 16).padding(.top, 70)
                    }).fullScreenCover(isPresented: $showSheet, content: {
                        MakingTeamView(showSheet: $showSheet, showAlert: $showAlert)
                    })
                    
                        
                    Button(action: {
                        showTimeSheet.toggle()
                    }, label: {
                        HStack(){
                            
                            Text("ETA를 가장 잘 활용하는 방법은 ?")
                                .font(
                                    Font.custom("Pretendard Variable", size: 20)
                                        .weight(.bold)
                                )
                                .kerning(0.02)
                                .foregroundColor(.black).padding(.leading, 26)
                            Spacer()
                            
                        }.foregroundColor(.clear)
                            .frame(width: 360, height: 90)
                            .background(.white)
                            .cornerRadius(20)
                            .shadow(color: Color(red: 0.2, green: 0.12, blue: 0.06).opacity(0.1), radius: 10, x: 5, y: 3)
                    }).fullScreenCover(isPresented: $showTimeSheet, content: {
                        CustomAcceptAlertView()
                    })
                    
                    Spacer().frame(height: 220)
                    
                }.frame(width: .infinity)
            }
        }.background(Color(uiColor: gray02 ?? .gray))
    }

    struct CollectionViewCell: View {
        var body: some View {
            VStack(alignment: .leading)
            {
                
                HStack{
                    // H1
                    Text("TEAM MEETA")
                        .font(
                            Font.custom("Pretendard Variable", size: 20)
                                .weight(.bold)
                        )
                        .kerning(0.02)
                        .foregroundColor(.black).padding(.top, 10).padding(.leading, 0).frame(width: .infinity)
                    
                    Spacer()
                }.padding(.leading, 26)
                
                // Body2
                Text("9명이 회의에 참여하고 있어요!")
                    .font(
                        Font.custom("Pretendard Variable", size: 12)
                            .weight(.bold)
                    )
                    .kerning(0.012)
                    .foregroundColor(Color(red: 1, green: 0.44, blue: 0.07)).padding(.bottom, 20).padding(.top, 6).padding(.leading, 26).frame(height: 14)
                
                Button(action: {
                    
                }, label: {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 163, height: 30)
                            .background(Color(red: 1, green: 0.44, blue: 0.07))
                            .cornerRadius(40)
                        // Body2
                        Text("2023.11.28 오후 6시~9시")
                            .font(
                                Font.custom("Pretendard Variable", size: 12)
                                    .weight(.bold)
                            )
                            .kerning(0.012)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                    .frame(width: 163, height: 31)
                }).padding(.leading, 24)
                
            }.foregroundColor(.clear)
                .frame(width: 341, height: 155)
                .background(.white)
                .cornerRadius(20)
                .shadow(color: Color(red: 0.2, green: 0.12, blue: 0.06).opacity(0.1), radius: 10, x: 5, y: 3)
        }
    }
}

#Preview {
    HomeView()
}
