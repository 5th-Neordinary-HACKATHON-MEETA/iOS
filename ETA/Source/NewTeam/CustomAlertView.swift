//
//  AddTeamAlertView.swift
//  ETA
//
//  Created by 윤지성 on 11/26/23.
//

import SwiftUI

struct CustomAlertView: View {
    var title: String?
    var message: String?
    var primaryButtonLabel: String
    var primaryButtonAction: () -> Void
    var secondaryButtonLabel: String?
    var secondaryButtonAction: (() -> Void)?
    var image: Image?
    
    var body: some View {
        VStack {
            if let image = image {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
            } else if let title = title{
                Text(title)
                    .font(
                    Font.custom("Pretendard Variable", size: 20)
                    .weight(.bold)
                    )
                    .kerning(0.02)
                    .multilineTextAlignment(.center)
            }
            if let message = message {
                Text(message)
                    .font(
                    Font.custom("Pretendard Variable", size: 17)
                    .weight(.medium)
                    )
                    .kerning(0.017)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.47, green: 0.47, blue: 0.47))
                    .multilineTextAlignment(.center)
                    .padding()
            }
            
            HStack(spacing: 16) {
                Button(action: {
                    self.primaryButtonAction()
                }, label: {
                    Text(primaryButtonLabel)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(primary ?? .orange))
                        .cornerRadius(12)
                })
                if let secondaryButtonLabel = secondaryButtonLabel {
                    Button(action: {
                        self.secondaryButtonAction?()
                    }, label: {
                        Text(secondaryButtonLabel)
                            .font(.headline)
                            .foregroundColor(.blue)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.blue, lineWidth: 2)
                            )
                    })
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 20)
    }
}



struct CustomAlertView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CustomAlertView(title: "팀 생성 완료!", message: "팀원들에게 링크를 공유해 보세요.", primaryButtonLabel: "확인", primaryButtonAction: {})
                .previewLayout(.sizeThatFits)
                .padding()
            
            CustomAlertView(title: "Error!", message: "There was an error updating your profile.", primaryButtonLabel: "Try Again", primaryButtonAction: {}, secondaryButtonLabel: "Cancel", secondaryButtonAction: {})
                .previewLayout(.sizeThatFits)
                .padding()
            
            CustomAlertView(title: "Confirmation", message: "Are you sure you want to delete this item?", primaryButtonLabel: "Yes", primaryButtonAction: {}, secondaryButtonLabel: "No", secondaryButtonAction: {})
                .previewLayout(.sizeThatFits)
                .padding()
            
            CustomAlertView(title: "Warning!", message: "You are about to perform a critical operation.", primaryButtonLabel: "Proceed", primaryButtonAction: {}, secondaryButtonLabel: "Cancel", secondaryButtonAction: {})
                .previewLayout(.sizeThatFits)
                .padding()
            
            CustomAlertView(
                message: "An error occurred.",
                primaryButtonLabel: "OK",
                primaryButtonAction: {},
                secondaryButtonLabel: nil,
                secondaryButtonAction: nil,
                image: Image(systemName: "exclamationmark.triangle")
            )
            .previewLayout(.sizeThatFits)
            .padding()
            
        }
    }
}

