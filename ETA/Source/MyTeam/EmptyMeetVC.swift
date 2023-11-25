//
//  EmptyMeetVC.swift
//  ETA
//
//  Created by YOUJIM on 11/26/23.
//

import UIKit

import SnapKit
import Then

class EmptyMeetVC: UIViewController {
    
    
    // MARK: Variable
    
    var previousButton: UIButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        $0.tintColor = gray09
        $0.addTarget(self, action: #selector(didPreviousButtonTapped), for: .touchUpInside)
    }
    
    var teamNameLabel: UILabel = UILabel().then {
        $0.font = subTitle01
        $0.text = "TEAM ETA"
        $0.textColor = gray09
    }
    
    var emptyInfoLabel: UILabel = UILabel().then {
        $0.text = "아직 예정된 회의가 없어요."
        $0.font = subTitle01
        $0.textColor = gray06
    }
    
    var noticeLabel: UILabel = UILabel().then {
        $0.text = "공지사항"
        $0.font = subTitle01
        $0.textColor = gray09
    }
    
    var postNewNoticeButton: UIButton = UIButton().then {
        $0.setTitle("새로 등록하기", for: .normal)
        $0.titleLabel?.font = body01
        $0.setTitleColor(primary, for: .normal)
        $0.addTarget(self, action: #selector(didPostNewNoticeButtonTapped), for: .touchUpInside)
    }
    
    var noticeBackgroundView: UIView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 12
        $0.layer.borderColor = primary?.cgColor
        $0.layer.borderWidth = 0.8
    }
    
    var noticeContentLabel: UILabel = UILabel().then {
        $0.text = "등록된 공지사항이 없어요."
        $0.font = subTitle01
        $0.textColor = gray06
    }
    
    var previousMeetLabel: UILabel = UILabel().then {
        $0.textColor = gray09
        $0.text = "지난 회의"
        $0.font = subTitle01
    }
    
    var emptyMeetInfoLabel: UILabel = UILabel().then {
        $0.text = "아직 진행했던 회의가 없어요."
        $0.font = subTitle01
        $0.textColor = gray06
    }
    
    var makeMeetButton: UIButton = UIButton().then {
        $0.setTitle("새 회의 만들기", for: .normal)
        $0.setTitleColor(gray01, for: .normal)
        $0.titleLabel?.font = subTitle01
        $0.layer.backgroundColor = primary?.cgColor
        $0.layer.cornerRadius = 12
        $0.addTarget(self, action: #selector(didMeetButtonTapped), for: .touchUpInside)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        setUpLayout()
        setUpConstraint()
    }
    
    private func setUpUI() {
        view.backgroundColor = gray02
    }
    
    private func setUpLayout() {
        [
            previousButton,
            teamNameLabel,
            emptyInfoLabel,
            noticeLabel,
            postNewNoticeButton,
            noticeBackgroundView,
            noticeContentLabel,
            previousMeetLabel,
            emptyMeetInfoLabel,
            makeMeetButton
        ].forEach { view.addSubview($0) }
    }
    
    private func setUpConstraint() {
        previousButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(66)
            $0.left.equalToSuperview().offset(16)
            $0.width.height.equalTo(24)
        }
        
        teamNameLabel.snp.makeConstraints {
            $0.centerY.equalTo(previousButton)
            $0.centerX.equalToSuperview()
        }
        
        emptyInfoLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(teamNameLabel.snp.bottom).offset(60)
        }
        
        noticeLabel.snp.makeConstraints {
            $0.top.equalTo(emptyInfoLabel.snp.bottom).offset(68)
            $0.left.equalToSuperview().offset(16)
        }
        
        postNewNoticeButton.snp.makeConstraints {
            $0.centerY.equalTo(noticeLabel)
            $0.right.equalToSuperview().offset(-16)
        }
        
        noticeBackgroundView.snp.makeConstraints {
            $0.top.equalTo(noticeLabel.snp.bottom).offset(16)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-16)
            $0.height.equalTo(102)
        }
        
        noticeContentLabel.snp.makeConstraints {
            $0.centerY.equalTo(noticeBackgroundView)
            $0.left.equalTo(noticeBackgroundView).offset(31)
        }
        
        previousMeetLabel.snp.makeConstraints {
            $0.top.equalTo(noticeBackgroundView.snp.bottom).offset(30)
            $0.left.equalToSuperview().offset(16)
        }
        
        emptyMeetInfoLabel.snp.makeConstraints {
            $0.top.equalTo(previousMeetLabel.snp.bottom).offset(51)
            $0.left.equalTo(previousMeetLabel.snp.right).offset(21)
        }
        
        makeMeetButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-42)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-16)
            $0.height.equalTo(52)
        }
    }
    
    
    // MARK: Function
    
    @objc func didPostNewNoticeButtonTapped() {
        let noticePopUpVC = NewNoticePopUpVC()
        
        noticePopUpVC.view.backgroundColor = .black.withAlphaComponent(0.5)
        noticePopUpVC.modalTransitionStyle = .crossDissolve
        noticePopUpVC.modalPresentationStyle = .overFullScreen
        
        self.present(noticePopUpVC, animated: true)
    }
    
    @objc func didMeetButtonTapped() {
        let nextVC = AddNewMeetingViewController()
        nextVC.modalPresentationStyle = .fullScreen
        
        self.present(nextVC, animated: true)
    }
    
    @objc func didPreviousButtonTapped() {
        self.dismiss(animated: true)
    }
}


import SwiftUI
@available(iOS 16.0, *)
struct EmptyMeetVC_Preview: PreviewProvider {
    static var previews: some View {
        EmptyMeetVC().toPreview()
            //.edgesIgnoringSafeArea(.all)
    }
}


