//
//  NetworkErrorAlertView.swift
//  ETA
//
//  Created by 윤지성 on 11/26/23.
//

import SwiftUI

struct NetworkErrorAlertView: View {
    @Binding var showSheet: Bool
    @Binding var showAlert: Bool
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{

        }.background(Color.black.opacity(0.4))
        CustomAlertView(title: "네트워크 연결에 실패했습니다.", message: "잠시 후에 다시 시도해주세요.", primaryButtonLabel: "확인", primaryButtonAction: {

            showAlert = false
            showSheet = false


        })
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

