//
//  MyTeamDetailVC.swift
//  ETA
//
//  Created by YOUJIM on 11/25/23.
//

import UIKit

import SnapKit
import Then

class MyTeamDetailVC: UIViewController {
    
    
    // MARK: Variable
    
    var previousButton: UIButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        $0.tintColor = gray09
    }
    
    var teamNameLabel: UILabel = UILabel().then {
        $0.font = subTitle01
        $0.text = "TEAM ETA"
        $0.textColor = gray09
    }
    
    var informationLabel: UILabel = UILabel().then {
        $0.font = subTitle01
        $0.text = "다음 회의 일정이 있어요 :)"
        $0.textColor = gray09
    }
    
    var meetBackgroundView: UIView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
        $0.layer.shadowColor = UIColor.black.cgColor // 그림자 색상
        $0.layer.shadowOpacity = 0.1 // 그림자 투명도
        $0.layer.shadowOffset = CGSize(width: 0, height: 5) // 그림자 위치
        $0.layer.shadowRadius = 10 // 그림자의 블러 반경
    }
    
    var meetLabel: UILabel = UILabel().then {
        $0.text = "아이디에이션 회의"
        $0.font = h1
        $0.textColor = gray09
    }
    
    var teamMemberCountLabel: UILabel = UILabel().then {
        $0.font = body02
        $0.text = "9명"
        $0.textColor = primary
    }
    
    var teamMemberCountInfoLabel: UILabel = UILabel().then {
        $0.font = body02
        $0.text = "이 회의에 참여하고 있어요!"
        $0.textColor = gray07
    }
    
    var dateButton: UIButton = UIButton().then {
        $0.isEnabled = false
        $0.setTitle("2023.11.28 오후 6시~9시", for: .normal)
        $0.setTitleColor(gray01, for: .normal)
        $0.titleLabel?.font = body02
        $0.backgroundColor = primary
        $0.layer.cornerRadius = 14
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
        $0.text = "다음 회의까지 해올 일"
        $0.font = subTitle01
        $0.textColor = gray09
    }
    
    var authorImageView: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "Author")
        $0.contentMode = .scaleAspectFit
    }
    
    var authorLabel: UILabel = UILabel().then {
        $0.font = body03
        $0.text = "김지은"
        $0.textColor = gray09
    }
    
    var previousMeetLabel: UILabel = UILabel().then {
        $0.textColor = gray09
        $0.text = "지난 회의"
        $0.font = subTitle01
    }
    
    var previousTableView: UITableView = UITableView().then {
        $0.register(PreviousMeetTableViewCell.self, forCellReuseIdentifier: PreviousMeetTableViewCell().cellID)
        $0.backgroundColor = gray02
    }
    
    var makeMeetButton: UIButton = UIButton().then {
        $0.setTitle("새 회의 만들기", for: .normal)
        $0.setTitleColor(gray01, for: .normal)
        $0.titleLabel?.font = subTitle01
        $0.layer.backgroundColor = primary?.cgColor
        $0.layer.cornerRadius = 12
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        setUpLayout()
        setUpConstraint()
        setUpDelegate()
    }
    
    private func setUpUI() {
        view.backgroundColor = gray02
    }
    
    private func setUpLayout() {
        [
            previousButton,
            teamNameLabel,
            informationLabel,
            meetBackgroundView,
            meetLabel,
            teamMemberCountLabel,
            teamMemberCountInfoLabel,
            dateButton,
            noticeLabel,
            postNewNoticeButton,
            noticeBackgroundView,
            noticeContentLabel,
            authorImageView,
            authorLabel,
            previousMeetLabel,
            previousTableView,
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
        
        informationLabel.snp.makeConstraints {
            $0.top.equalTo(previousButton.snp.bottom).offset(26)
            $0.left.equalToSuperview().offset(16)
        }
        
        meetBackgroundView.snp.makeConstraints {
            $0.top.equalTo(informationLabel.snp.bottom).offset(16)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-16)
            $0.height.equalTo(155)
        }
        
        meetLabel.snp.makeConstraints {
            $0.top.equalTo(meetBackgroundView.snp.top).offset(30)
            $0.left.equalTo(meetBackgroundView).offset(30)
        }
        
        teamMemberCountLabel.snp.makeConstraints {
            $0.top.equalTo(meetLabel.snp.bottom).offset(6)
            $0.left.equalTo(meetLabel)
        }
        
        teamMemberCountInfoLabel.snp.makeConstraints {
            $0.centerY.equalTo(teamMemberCountLabel)
            $0.left.equalTo(teamMemberCountLabel.snp.right)
        }
        
        dateButton.snp.makeConstraints {
            $0.top.equalTo(teamMemberCountLabel.snp.bottom).offset(20)
            $0.left.equalTo(teamMemberCountLabel.snp.left)
            $0.width.equalTo(170)
        }
        
        noticeLabel.snp.makeConstraints {
            $0.top.equalTo(meetBackgroundView.snp.bottom).offset(40)
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
            $0.top.equalTo(noticeBackgroundView).offset(27)
            $0.left.equalTo(noticeBackgroundView).offset(26)
        }
        
        authorImageView.snp.makeConstraints {
            $0.top.equalTo(noticeContentLabel.snp.bottom).offset(12)
            $0.left.equalTo(noticeContentLabel.snp.left)
        }
        
        authorLabel.snp.makeConstraints {
            $0.centerY.equalTo(authorImageView)
            $0.left.equalTo(authorImageView.snp.right).offset(6)
        }
        
        previousMeetLabel.snp.makeConstraints {
            $0.top.equalTo(noticeBackgroundView.snp.bottom).offset(30)
            $0.left.equalToSuperview().offset(16)
        }
        
        makeMeetButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-42)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-16)
            $0.height.equalTo(52)
        }
        
        previousTableView.snp.makeConstraints {
            $0.top.equalTo(previousMeetLabel.snp.bottom)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-16)
            $0.bottom.equalTo(makeMeetButton.snp.top).offset(-34)
        }
    }
    
    private func setUpDelegate() {
        previousTableView.dataSource = self
        previousTableView.delegate = self
    }
    
    
    // MARK: Function
    
    @objc func didPostNewNoticeButtonTapped() {
        // self.present(URLView, animated: true, completion: nil)
    }
}


extension MyTeamDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    /// 데이터 삽입 구현
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = previousTableView.dequeueReusableCell(withIdentifier: PreviousMeetTableViewCell().cellID, for: indexPath) as! PreviousMeetTableViewCell
        
        cell.selectionStyle = .none
        cell.backgroundColor = gray02
        
        return cell
    }
}

import SwiftUI
@available(iOS 16.0, *)
struct MyTeamDetailVC_Preview: PreviewProvider {
    static var previews: some View {
        MyTeamDetailVC().toPreview()
            //.edgesIgnoringSafeArea(.all)
    }
}

