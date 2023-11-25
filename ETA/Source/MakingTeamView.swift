//
//  MakingTeamView.swift
//  ETA
//
//  Created by 윤지성 on 11/25/23.
//

import SwiftUI

struct MakingTeamView: View {
    @Binding var showSheet: Bool
    @Binding var showAlert: Bool

    @Environment(\.presentationMode) var presentationMode
    @State private var isDetailViewPresented = false
    @State private var teamName = ""
    @State private var teamNumber = ""
    @State var startDate = Date()
    @State var endDate = Date()

    
    var body: some View {
        VStack {
            
            Text("팀 생성하기")
            .font(
            Font.custom("Pretendard Variable", size: 17)
            .weight(.bold)
            )
            .kerning(0.0255)
            .multilineTextAlignment(.center)
            .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14)).padding(.bottom, 38)
        

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
            }.padding(.top, 10)
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
            
            ZStack{
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 361, height: 58)
                    .background(.white)
                    .cornerRadius(10)
                HStack{
                    Spacer()

                    DatePicker(
                        "",
                        selection: $startDate,
                        displayedComponents: [.date]
                    ).environment(\.locale, Locale.init(identifier: "ko_KR")).foregroundColor(.clear).tint(Color(primary ?? .orange)).labelsHidden()              .colorMultiply(Color.white).font(Font.custom("Pretendard Variable", size: 17).weight(.medium)).kerning(0.017).foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14))
                    
                    Spacer()
                    // Subtitle1
                    Text("~")
                        .font(
                            Font.custom("Pretendard Variable", size: 17)
                                .weight(.bold)
                        )
                        .kerning(0.0255)
                        .foregroundColor(Color(red: 0.74, green: 0.74, blue: 0.74))
                    Spacer()
                    
                    DatePicker(
                        "",
                        selection: $endDate,
                        in: startDate...,
                        displayedComponents: [.date]
                    ).environment(\.locale, Locale.init(identifier: "ko_KR")).foregroundColor(.clear).tint(Color(primary ?? .orange)).labelsHidden()              .colorMultiply(Color.white).font(Font.custom("Pretendard Variable", size: 17).weight(.medium)).kerning(0.017).foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14))
                    Spacer()

                }
            }.padding(.top, 16)
            
            
            Spacer()
            
            Button(action: {
               // self.isDetailViewPresented = true
                if(teamName != "" && teamNumber != ""){
                    showAlert.toggle()

                }
                //presentationMode.wrappedValue.dismiss()
                }, label: {
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
                .background((teamName == "" || teamNumber == "") ? Color(gray04 ?? UIColor(red: 0.894, green: 0.894, blue: 0.894, alpha: 1)) : Color(red: 1, green: 0.44, blue: 0.07))
                .cornerRadius(10)
                }).padding(.bottom, 10).fullScreenCover(isPresented: $showAlert, content: {
                    AlertView(showSheet: self.$showSheet, showAlert: $showAlert).presentationBackground(Color.black.opacity(0.4))
                })
                    
            
        }.background(Color(uiColor: gray02 ?? .gray))
            .onAppear (perform : UIApplication.shared.hideKeyboard).navigationBarBackButtonTitleHidden().navigationBarBackButtonHidden(true)
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

// Extension to create a custom sheet modifier
extension View {
    func customSheet<SheetContent: View>(isPresented: Binding<Bool>, @ViewBuilder content: @escaping () -> SheetContent) -> some View {
        self.modifier(CustomSheetViewModifier(isPresented: isPresented, content: content))
    }
}

// Custom modifier to manage the presentation of the custom sheet view
struct CustomSheetViewModifier<SheetContent: View>: ViewModifier {
    @Binding var isPresented: Bool
    let content: () -> SheetContent

    func body(content: Content) -> some View {
        content.overlay(
            Group {
                if isPresented {
                    ZStack {
                        Color.black.opacity(0.4)
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                                // Dismiss the sheet when tapping outside
                                isPresented = false
                            }

                        self.content()
                            .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.4)
                            .background(Color.white)
                            .cornerRadius(16)
                            .padding()
                    }
                }
            }
        )
    }
}

