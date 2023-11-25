//
//  WaitTimeSelectVC.swift
//  ETA
//
//  Created by YOUJIM on 11/26/23.
//

import UIKit

class WaitTimeSelectVC: UIViewController {
    
    
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
        $0.text = "시간 선택을 기다리는 회의가 있어요!"
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
    
    var clockButton: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "Clock")
        $0.contentMode = .scaleAspectFit
    }
    
    var meetLabel: UILabel = UILabel().then {
        $0.text = "아이디에이션 회의"
        $0.font = h1
        $0.textColor = gray09
    }
    
    var lineImageView: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "Line")
    }
    
    var meetButton: UIButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        $0.tintColor = gray05
    }
    
    var votedInfoLabel: UILabel = UILabel().then {
        $0.font = subTitle02
        $0.text = "투표한 팀원"
        $0.textColor = gray09
    }
    
    var votedTeamMemberCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
        $0.minimumLineSpacing = 10
        $0.minimumInteritemSpacing = 10
    }).then {
        $0.showsHorizontalScrollIndicator = false
         $0.register(VotedTeamMemberCollectionViewCell.self, forCellWithReuseIdentifier: VotedTeamMemberCollectionViewCell.cellID)
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
            clockButton,
            meetLabel,
            lineImageView,
            meetButton,
            votedInfoLabel,
            votedTeamMemberCollectionView,
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
            $0.height.equalTo(139)
        }
        
        clockButton.snp.makeConstraints {
            $0.top.equalTo(meetBackgroundView).offset(30)
            $0.left.equalTo(meetBackgroundView).offset(30)
        }
        
        meetLabel.snp.makeConstraints {
            $0.centerY.equalTo(clockButton)
            $0.left.equalTo(clockButton.snp.right).offset(8)
        }
        
        lineImageView.snp.makeConstraints {
            $0.centerX.equalTo(meetBackgroundView)
            $0.centerY.equalTo(meetBackgroundView).offset(5)
            $0.width.equalTo(300)
            $0.height.equalTo(2)
        }
        
        meetButton.snp.makeConstraints {
            $0.top.equalTo(meetBackgroundView).offset(30)
            $0.right.equalTo(meetBackgroundView.snp.right).offset(-30)
        }
        
        votedInfoLabel.snp.makeConstraints {
            $0.top.equalTo(lineImageView.snp.bottom).offset(21)
            $0.left.equalTo(meetBackgroundView).offset(27)
        }
        
        votedTeamMemberCollectionView.snp.makeConstraints {
            $0.centerY.equalTo(votedInfoLabel)
            $0.left.equalTo(votedInfoLabel.snp.right).offset(10)
            $0.right.equalTo(meetBackgroundView.snp.right).offset(-20)
            $0.height.equalTo(26)
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
        
        votedTeamMemberCollectionView.delegate = self
        votedTeamMemberCollectionView.dataSource = self
    }
    
    
    // MARK: Function
    
    @objc func didPostNewNoticeButtonTapped() {
        // self.present(URLView, animated: true, completion: nil)
    }
}

extension WaitTimeSelectVC: UITableViewDelegate, UITableViewDataSource {
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

extension WaitTimeSelectVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VotedTeamMemberCollectionViewCell.cellID, for: indexPath) as! VotedTeamMemberCollectionViewCell
        
        return cell
    }
    
    /// 셀 별 사이즈 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 45, height: 26)
    }
}

import SwiftUI
@available(iOS 16.0, *)
struct WaitTimeSelectVC_Preview: PreviewProvider {
    static var previews: some View {
        WaitTimeSelectVC().toPreview()
            //.edgesIgnoringSafeArea(.all)
    }
}
