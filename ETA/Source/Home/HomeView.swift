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
    @State private var networkError = false
    @State private var showTimeSheet = false
    @State private var currentMeeting = MostCurrentMeeting(id: "123", name: "TEAM ETA", dateTime: "2023.11.28 18:00", duration: 4, location: "공덕", team: CurrentTeam(id: "ETA", name: "ETA", maxMember: 5, startedAt: "2023-02-25T10:52:58.000Z", endedAt: "2023-02-25T10:52:58.000Z")  )
    @State private var teamNum = 2


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
                        CollectionViewCell(currentMeeting: $currentMeeting, teamNum: $teamNum).offset(y: 100).onAppear {
                            // 앱이 나타날 때 API 호출
                            setUPApi()
                        }
                        
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
                        MakingTeamView(showSheet: $showSheet, showAlert: $showAlert, networkError: $networkError)
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
                        CustomAcceptAlertView().presentationBackground(Color.black.opacity(0.4))
                    })
                    
                    Spacer().frame(height: 220)
                    
                }.frame(width: .infinity)
            }
        }.background(Color(uiColor: gray02 ?? .gray))
        
        
    }

    struct CollectionViewCell: View {
        @Binding var currentMeeting: MostCurrentMeeting
        @Binding var teamNum: Int
        var body: some View {
            VStack(alignment: .leading)
            {
                
                HStack{
                    // H1
                    Text(currentMeeting.name)
                        .font(
                            Font.custom("Pretendard Variable", size: 20)
                                .weight(.bold)
                        )
                        .kerning(0.02)
                        .foregroundColor(.black).padding(.top, 10).padding(.leading, 0).frame(width: .infinity)
                    
                    Spacer()
                }.padding(.leading, 26)
                
                // Body2
                Text("\(String(teamNum))명이 회의에 참여하고 있어요!")
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
                        Text(formattedDate(from: convertStringToMeetingDate(currentMeeting.dateTime)) )
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
    func setUPApi() {
        APIManager.shared.getData(
            urlEndpointString: Constant.currentMeeting,
            responseDataType: APIModel<CurrentMeetingRes>?.self,
            requestDataType: teamRequestModel.self,
            parameter: nil) { response in
                print("response 결과값 \(response.self)")

                if let result = response?.result?.result {
                    DispatchQueue.main.async {
                        self.currentMeeting = result.mostCurrentMeeting ??  MostCurrentMeeting(id: "123", name: "TEAM ETA", dateTime: "2023.11.28 18:00", duration: 4, location: "공덕", team: CurrentTeam(id: "ETA", name: "ETA", maxMember: 5, startedAt: "2023-02-25T10:52:58.000Z", endedAt: "2023-02-25T10:52:58.000Z")  )
                        self.teamNum = result.numUsers ?? 2
                    }
                    
                }
            }
    }
}

func convertStringToMeetingDate(_ dateString: String) -> Date {
    let formatter = ISO8601DateFormatter()
    let currentDate = Date()

    // Calendar 객체 생성
    let calendar = Calendar.current

    // 현재 날짜의 년, 월, 일을 가져오기
    let components = calendar.dateComponents([.year, .month, .day], from: currentDate)

    // 오후 5시로 시간을 설정
    var dateComponents = DateComponents()
    dateComponents.year = components.year
    dateComponents.month = components.month
    dateComponents.day = components.day
    dateComponents.hour = 17 // 24시간 형식에서는 17이 오후 5시를 나타냅니다.
    dateComponents.minute = 0
    dateComponents.second = 0

    // Calendar를 사용하여 날짜와 시간 객체 생성
    let afternoonFiveDate = calendar.date(from: dateComponents)
    
    return formatter.date(from: dateString) ?? afternoonFiveDate!
}

func formattedDate(from date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy.MM.dd a hh"
    return formatter.string(from: date)
}

#Preview {
    HomeView()
}
