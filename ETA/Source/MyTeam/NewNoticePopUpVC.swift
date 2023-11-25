//
//  NewNoticePopUpVC.swift
//  ETA
//
//  Created by YOUJIM on 11/26/23.
//

import UIKit

import SnapKit
import Then

class NewNoticePopUpVC: UIViewController {
    
    
    // MARK: Variable
    
    var popUpView: UIView = UIView().then {
        $0.backgroundColor = .white
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
    }
    
    var noticeInfoLabel: UILabel = UILabel().then {
        $0.font = h1
        $0.text = "새로운 공지사항 등록"
        $0.textColor = gray09
    }
    
    var popButton: UIButton = UIButton().then {
        $0.setImage(UIImage(systemName: "xmark"), for: .normal)
        $0.tintColor = gray05
        $0.addTarget(self, action: #selector(didPopButtonTapped), for: .touchUpInside)
    }
    
    var textBackgroundView: UIView = UIView().then {
        $0.backgroundColor = gray02
        $0.layer.cornerRadius = 8
    }
    
    var noticeTextView: UITextView = UITextView().then {
        $0.backgroundColor = .clear
        $0.font = UIFont(name: "PretendardVariable-Medium", size: 17)
        $0.textColor = gray06
        $0.text = "등록할 공지사항을 입력해주세요."
    }
    
    var uploadButton: UIButton = UIButton().then {
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = primary
        $0.isEnabled = false
        $0.layer.cornerRadius = 8
        $0.addTarget(self, action: #selector(didUploadButtonTapped), for: .touchUpInside)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        setUpLayout()
        setUpDelegate()
        setUpConstraint()
    }
    

    // MARK: View
    
    func setUpView() {
        
    }
    
    
    // MARK: Layout
    
    func setUpLayout() {
        [
            popUpView,
            noticeInfoLabel,
            popButton,
            textBackgroundView,
            noticeTextView,
            uploadButton
        ].forEach { view.addSubview($0) }
    }
    
    // MARK: Delegate
    
    func setUpDelegate() {
        noticeTextView.delegate = self
    }
    
    
    // MARK: Constraint
    
    func setUpConstraint() {
        popUpView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalTo(361)
            $0.height.equalTo(310)
        }
        
        noticeInfoLabel.snp.makeConstraints {
            $0.top.equalTo(popUpView).offset(40)
            $0.centerX.equalToSuperview()
        }
        
        uploadButton.snp.makeConstraints {
            $0.bottom.equalTo(popUpView.snp.bottom).offset(-26)
            $0.left.equalTo(popUpView).offset(30)
            $0.right.equalTo(popUpView.snp.right).offset(-30)
            $0.height.equalTo(48)
        }
        
        textBackgroundView.snp.makeConstraints {
            $0.top.equalTo(noticeInfoLabel.snp.bottom).offset(16)
            $0.left.equalTo(popUpView).offset(30)
            $0.right.equalTo(popUpView.snp.right).offset(-30)
            $0.bottom.equalTo(uploadButton.snp.top).offset(-16)
        }
        
        popButton.snp.makeConstraints {
            $0.top.equalTo(popUpView).offset(20)
            $0.right.equalTo(popUpView).offset(-34)
        }
        
        noticeTextView.snp.makeConstraints {
            $0.top.equalTo(textBackgroundView.snp.top).offset(20)
            $0.left.equalTo(textBackgroundView).offset(20)
            $0.right.bottom.equalTo(textBackgroundView).offset(-20)
        }
    }
    
    
    // MARK: Function
    
    /// x 버튼 눌렀을 때
    @objc func didPopButtonTapped() {
        self.dismiss(animated: true)
    }
    
    /// 확인 버튼 눌렀을 때
    @objc func didUploadButtonTapped() {
        self.dismiss(animated: true)
    }
}

/// placeholder를 위한 TextView extension
extension NewNoticePopUpVC: UITextViewDelegate {
    /// 입력 시작하면 placeholder 사라지도록 설정
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "등록할 공지사항을 입력해주세요." {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        /// 내용 채워지면 게시 버튼 활성화되도록 구현
        if textView.text.count > 0 && textView.text != "등록할 공지사항을 입력해주세요." {
            uploadButton.backgroundColor = primary
            uploadButton.isEnabled = true
        }
    }

    /// placeholder 글자 수 0일 때 나타나도록 설정
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = "등록할 공지사항을 입력해주세요."
            textView.textColor = gray05
        }
    }
}


import SwiftUI
@available(iOS 16.0, *)
struct NewNoticePopUpVC_Preview: PreviewProvider {
    static var previews: some View {
        NewNoticePopUpVC().toPreview()
            //.edgesIgnoringSafeArea(.all)
    }
}
