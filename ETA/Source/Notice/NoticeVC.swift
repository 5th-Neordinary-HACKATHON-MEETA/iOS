//
//  NoticeVC.swift
//  ETA
//
//  Created by YOUJIM on 11/25/23.
//

import SwiftUI
import UIKit

import SnapKit
import Then


class NoticeVC: UIViewController {

    // MARK: Variables
    
    var announces = [Announcements]()
    
    var bellImage = UIImage(named: "Bell")
    
    var logoImageView: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "LogoOrange")
        $0.contentMode = .scaleAspectFit
    }
    
    var alertButton: UIButton = UIButton().then {
        $0.setImage(UIImage(named: "Bell"), for: .normal)
        $0.tintColor = gray09
    }
    
    var noticeLabel: UILabel = UILabel().then {
        $0.font = h1
        $0.text = "우리 회의에 너만 못 온 그날"
        $0.textColor = gray09
    }
    
    var captionLabel: UILabel = UILabel().then {
        $0.font = caption2
        $0.text = "팀 별 공지사항을 한 눈에 확인할 수 있어요."
        $0.textColor = gray07
    }
    
    var teamTableView: UITableView = UITableView().then {
        $0.register(TeamTableViewCell.self, forCellReuseIdentifier: TeamTableViewCell().cellID)
        $0.separatorStyle = .none
        $0.backgroundColor = gray02
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
        view.backgroundColor = gray02
        
        APIManager.shared.getData(
            urlEndpointString: Constant.getAnnouncement,
            responseDataType: APIModel<AnnouncementResponseModel>?.self,
            requestDataType: AnnouncementRequestModel.self,
            parameter: nil) { response in
                self.announces = response?.result?.announcements ?? []
                
                self.teamTableView.reloadData()
            }
    }
    
    
    // MARK: Layout
    
    func setUpLayout() {
        [
            logoImageView,
            alertButton,
            noticeLabel,
            captionLabel,
            teamTableView
        ].forEach { view.addSubview($0) }
    }
    
    // MARK: Delegate
    
    func setUpDelegate() {
        teamTableView.delegate = self
        teamTableView.dataSource = self
    }
    
    
    // MARK: Constraint
    
    func setUpConstraint() {
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(63)
            $0.left.equalToSuperview().offset(-12)
            $0.height.equalTo(25)
        }
        
        alertButton.snp.makeConstraints {
            $0.centerY.equalTo(logoImageView.snp.centerY)
            $0.right.equalToSuperview().offset(-16)
            $0.width.height.equalTo(24)
        }
        
        noticeLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(24)
            $0.left.equalToSuperview().offset(16)
        }
        
        captionLabel.snp.makeConstraints {
            $0.top.equalTo(noticeLabel.snp.bottom).offset(8)
            $0.left.equalTo(noticeLabel)
        }
        
        teamTableView.snp.makeConstraints {
            $0.top.equalTo(captionLabel.snp.bottom).offset(42)
            $0.left.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
}

// 리뷰 목록 구현을 위한 Delegate와 DataSource 구현
extension NoticeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return announces.count
    }
    
    /// 데이터 삽입 구현
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = teamTableView.dequeueReusableCell(withIdentifier: TeamTableViewCell().cellID, for: indexPath) as! TeamTableViewCell
        
        cell.selectionStyle = .none
        cell.backgroundColor = gray02
        
        cell.authorLabel.text = announces[indexPath.row].nickname
        cell.teamNameLabel.text = announces[indexPath.row].teamName
        cell.noticeLabel.text = announces[indexPath.row].content
        
        return cell
    }
}

struct NoticeVC_Preview: PreviewProvider {
    static var previews: some View {
        NoticeVC().toPreview()
            // .edgesIgnoringSafeArea(.all)
    }
}
