//
//  AlertView.swift
//  ETA
//
//  Created by 윤지성 on 11/26/23.
//

import SwiftUI

struct AlertView: View {
    @Binding var showSheet: Bool
    @Binding var showAlert: Bool
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack{

        }.background(Color.black.opacity(0.4))
        CustomAlertView(title: "팀 생성 완료!", message: "팀원들에게 링크를 공유해 보세요.", primaryButtonLabel: "확인", primaryButtonAction: {

            showAlert = false
            showSheet = false


        })
            .previewLayout(.sizeThatFits)
            .padding()
        
    }
}


