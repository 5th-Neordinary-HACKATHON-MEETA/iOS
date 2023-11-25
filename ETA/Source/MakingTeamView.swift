//
//  MakingTeamView.swift
//  ETA
//
//  Created by 윤지성 on 11/25/23.
//

import SwiftUI

struct MakingTeamView: View {
    @State private var teamName = ""
    @State private var teamNumber = ""
    
    var body: some View {
        VStack {
            // Subtitle1
            HStack{
                Text("새로운 팀의 이름을 알려주세요.")
                  .font(
                    Font.custom("Pretendard Variable", size: 17)
                      .weight(.bold)
                  )
                  .kerning(0.0255)
                  .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14)).padding(.leading, 20)
                Spacer()
            }.padding(.top, 30)
            ZStack{
                Rectangle()
                .foregroundColor(.clear)
                .frame(width: 361, height: 58)
                .background(.white)
                .cornerRadius(10)
                
                TextField("아이디를 입력해주세요.", text: $teamName)
                        .frame( height: 58)
                        .cornerRadius(10).padding(.leading, 30).padding(.trailing, 30).font(
                            Font.custom("Pretendard Variable", size: 17)
                            .weight(.medium)
                            )
            }
            
            HStack{
                Text("팀의 인원은 몇 명인가요?")
                  .font(
                    Font.custom("Pretendard Variable", size: 17)
                      .weight(.bold)
                  )
                  .kerning(0.0255)
                  .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14)).padding(.leading, 20)
                Spacer()
            }.padding(.top, 40)
            
            ZStack{
                Rectangle()
                .foregroundColor(.clear)
                .frame(width: 361, height: 58)
                .background(.white)
                .cornerRadius(10)
                
                TextField("팀원 수를 입력해주세요.", text: $teamNumber)
                        .frame( height: 58)            .keyboardType(.numberPad)
                        .cornerRadius(10).padding(.leading, 30).padding(.trailing, 30).font(
                            Font.custom("Pretendard Variable", size: 17)
                            .weight(.medium)
                            )
            }
            HStack{
                Text("팀 활동 기간을 알려주세요.")
                  .font(
                    Font.custom("Pretendard Variable", size: 17)
                      .weight(.bold)
                  )
                  .kerning(0.0255)
                  .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14)).padding(.leading, 20)
                Spacer()
            }.padding(.top, 40)
            
            HStack{
                ZStack{
                    Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 149, height: 58)
                    .background(.white)
                    .cornerRadius(10)
                    
                    Text("23년 11월 25일")
                      .font(
                        Font.custom("Pretendard Variable", size: 17)
                          .weight(.medium)
                      )
                      .kerning(0.017)
                      .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14))
                }.padding(.leading, 16)
                Spacer()
                // Subtitle1
                Text("부터")
                  .font(
                    Font.custom("Pretendard Variable", size: 17)
                      .weight(.bold)
                  )
                  .kerning(0.0255)
                  .foregroundColor(Color(red: 0.74, green: 0.74, blue: 0.74))
                Spacer()

                ZStack{
                    Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 149, height: 58)
                    .background(.white)
                    .cornerRadius(10)
                    
                    Text("23년 11월 26일")
                      .font(
                        Font.custom("Pretendard Variable", size: 17)
                          .weight(.medium)
                      )
                      .kerning(0.017)
                      .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14))
                }.padding(.trailing, 16)
            }.padding(.top, 16)
            
            
            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                HStack(alignment: .center, spacing: 10) { // Subtitle1
                    Text("완료")
                    .font(
                    Font.custom("Pretendard Variable", size: 17)
                    .weight(.bold)
                    )
                    .kerning(0.0255)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)  }
                .padding(.horizontal, 158)
                .padding(.vertical, 16)
                .frame(width: 361, height: 52, alignment: .center)
                .background(Color(red: 1, green: 0.44, blue: 0.07))
                .cornerRadius(10)
            }).padding(.bottom, 10)
            
        }.background(Color(uiColor: gray02 ?? .gray)) .navigationBarBackButtonTitleHidden().navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    // Subtitle1
                    Text("팀 생성하기")
                      .font(
                        Font.custom("Pretendard Variable", size: 17)
                          .weight(.bold)
                      )
                      .kerning(0.0255)
                      .multilineTextAlignment(.center)
                      .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14))
                }
            }
    }
}

#Preview {
    MakingTeamView()
}

extension View {

  func navigationBarBackButtonTitleHidden() -> some View {
    self.modifier(NavigationBarBackButtonTitleHiddenModifier())
  }
}

struct NavigationBarBackButtonTitleHiddenModifier: ViewModifier {

  @Environment(\.dismiss) var dismiss

  @ViewBuilder @MainActor func body(content: Content) -> some View {
    content
      .navigationBarBackButtonHidden(true)
      .navigationBarItems(
        leading: Button(action: { dismiss() }) {
          Image(systemName: "chevron.left")
                .foregroundColor(Color(uiColor: gray09 ?? .gray))
          .imageScale(.large) })
      .contentShape(Rectangle()) // Start of the gesture to dismiss the navigation
      .gesture(
        DragGesture(coordinateSpace: .local)
          .onEnded { value in
            if value.translation.width > .zero
                && value.translation.height > -30
                && value.translation.height < 30 {
              dismiss()
            }
          }
      )
  }
}
