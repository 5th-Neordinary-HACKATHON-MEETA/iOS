//
//  MakingTeamView.swift
//  ETA
//
//  Created by 윤지성 on 11/25/23.
//

import SwiftUI

struct MakingTeamView: View {
    @State private var isTeamCreationActive = false
    
    var body: some View {
        VStack {
            Text("Second Screen")
//                .navigationBarTitle("팀 생성하기", displayMode: .inline)
//                .navigationBarBackButtonHidden(true)
//                .navigationBarItems(leading: EmptyView())
//                .onAppear {
//                    
//                }
        }  .navigationBarBackButtonTitleHidden().navigationBarBackButtonHidden(true)
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
