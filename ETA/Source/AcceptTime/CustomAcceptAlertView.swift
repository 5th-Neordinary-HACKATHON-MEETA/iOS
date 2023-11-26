//
//  CustomAcceptAlertView.swift
//  ETA
//
//  Created by 윤지성 on 11/26/23.
//

import SwiftUI

struct CustomAcceptAlertView: View {
    func setDefault() {
        for index in meets.indices {
            meets[index].selected = false
        }
    }
    @State var selected: Int = 0
    @State var meets: [waitingMeet] = [waitingMeet(date: "11월 28일 오후 7시", num: "5"), waitingMeet(date: "11월 28일 오후 5시", num: "4"), waitingMeet(date: "11월 28일 오후 3시", num: "2"),waitingMeet(date: "11월 28일 오후 4시", num: "1"), waitingMeet(date: "11월 28일 오후 8시", num: "1")]
    var body: some View {
        VStack{
            Spacer().background(Color.black.opacity(0.4))
            VStack {
                // Subtitle1
                HStack{
                    Text("팀장님!\n시간 확정을 기다리는 회의가 있어요.")
                      .font(
                        Font.custom("Pretendard Variable", size: 17)
                          .weight(.bold)
                      )
                      .kerning(0.0255)
                      .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14)).padding(.leading, 30)
                    Spacer()
                }.padding(.top, 30)
                
                HStack{
                    // caption2
                    Text("팀원들이 가능한 시간대 중에서 선택해주세요.")
                      .font(
                        Font.custom("Pretendard Variable", size: 11)
                          .weight(.medium)
                      )
                      .kerning(0.011)
                      .foregroundColor(Color(red: 0.6, green: 0.6, blue: 0.6)).padding(.leading, 30)
                    Spacer()
                }.padding(.top, 2)
                
                List($meets, id: \.self) { $meet in
                    
                    Group {
                        if meet.selected {
                            selectedListViewCell(meet: $meet)
                                .listRowSeparator(.hidden)
                        }
                        else {
                            unSelectedListViewCell(meet: $meet)
                                .listRowSeparator(.hidden)
                        }
                    }
                }
                .listStyle(PlainListStyle())
                    .background(Color.white.opacity(0.9)) // 여기를 수정하여 배경을 불투명하게 설정
                
                Spacer()
                Button(action: {
                    
                }, label: {
                    HStack(alignment: .center, spacing: 0) {
                        // Subtitle1
                        Text("확인")
                          .font(
                            Font.custom("Pretendard Variable", size: 17)
                              .weight(.bold)
                          )
                          .kerning(0.0255)
                          .multilineTextAlignment(.center)
                          .foregroundColor(.white)
                    }
                    .padding(.horizontal, 0)
                    .padding(.vertical, 14)
                    .frame(width: 301, alignment: .center)
                    .background(Color(red: 1, green: 0.44, blue: 0.07))
                    .cornerRadius(10)
                }).padding(.bottom, 24)
                
                
            }
            .frame(width: 361, height: 512)
            .background(.white)
            .cornerRadius(20)
            Spacer().background(Color.black.opacity(0.0))
        }.frame(maxWidth: .infinity).background(Color.black.opacity(0.4))
    }
    
}

struct unSelectedListViewCell: View {
    @Binding var meet: waitingMeet
    var body: some View{
        Button(action: {
            meet.selected = true
        }, label: {
        
        VStack{
            HStack { Text(meet.date)
                    .font(
                        Font.custom("Pretendard Variable", size: 17)
                            .weight(.bold)
                    )
                    .kerning(0.0255)
                    .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14)).padding(.top, 20).padding(.leading, 15)
                Spacer()
            }
            .padding(.bottom, 19)
            .frame(width: .infinity, height: 59, alignment: .leading)
            .background(Color(red: 0.97, green: 0.97, blue: 0.97))
            .cornerRadius(10)
            
            HStack{
                Text(meet.num + "명")
                    .font(
                        Font.custom("Pretendard Variable", size: 11)
                            .weight(.medium)
                    )
                    .foregroundColor(Color(red: 1, green: 0.44, blue: 0.07))
                
                Text("참여자가 선택했어요.")
                    .font(
                        Font.custom("Pretendard Variable", size: 11)
                            .weight(.medium)
                    )
                    .kerning(0.011)
                    .foregroundColor(.black)
                Spacer()
                Spacer()

            }.padding(.leading, 6)
        }.listRowSeparator(.hidden)
        })
    }
}

struct selectedListViewCell: View {
    @Binding var meet: waitingMeet
    var body: some View{
        Button(action: {
            meet.selected = true
        }, label: {
            VStack{
                HStack { Text(meet.date)
                        .font(
                            Font.custom("Pretendard Variable", size: 17)
                                .weight(.bold)
                        )
                        .kerning(0.0255)
                        .foregroundColor(Color(red: 1, green: 0.44, blue: 0.07))
                        .padding(.top, 20).padding(.leading, 15)
                    Spacer()
                }
                .padding(.bottom, 19)
                .frame(width: .infinity, height: 59, alignment: .leading)
                .background(Color(red: 0.97, green: 0.97, blue: 0.97))
                .cornerRadius(10).overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .inset(by: 0.5)
                        .stroke(Color(red: 1, green: 0.44, blue: 0.07), lineWidth: 1)
                )
                
                HStack{
                    Text(meet.num + "명")
                        .font(
                            Font.custom("Pretendard Variable", size: 11)
                                .weight(.medium)
                        )
                        .foregroundColor(Color(red: 1, green: 0.44, blue: 0.07))
                    
                    Text("참여자가 선택했어요.")
                        .font(
                            Font.custom("Pretendard Variable", size: 11)
                                .weight(.medium)
                        )
                        .kerning(0.011)
                        .foregroundColor(.black)
                    Spacer()
                    Spacer()
                    
                }.padding(.leading, 6)
            }.listRowSeparator(.hidden)
        })
    }
}

struct waitingMeet: Hashable {
    let date: String
    let num: String
    var selected: Bool = false
}

#Preview {
    CustomAcceptAlertView()
}
