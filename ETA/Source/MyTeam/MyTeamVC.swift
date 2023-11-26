//
//  MyTeamVC.swift
//  ETA
//
//  Created by YOUJIM on 11/25/23.
//

import UIKit

import SnapKit
import Then

class MyTeamVC: UIViewController {
    
    // MARK: Variable
    
    var teams = [team]()
    
    var logoImageView: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "LogoOrange")
        $0.contentMode = .scaleAspectFit
    }
    
    var myTeamLabel: UILabel = UILabel().then {
        $0.text = "나의 팀"
        $0.font = subTitle01
        $0.textColor = gray09
    }
    
    var alertButton: UIButton = UIButton().then {
        $0.setImage(UIImage(named: "Bell"), for: .normal)
        $0.tintColor = gray09
    }
    
    var myTeamTableView: UITableView = UITableView().then {
        $0.register(MyTeamTableViewCell.self, forCellReuseIdentifier: MyTeamTableViewCell().cellID)
        $0.separatorStyle = .none
        $0.backgroundColor = gray02
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUPApi()
        setUpUI()
        setUpLayout()
        setUpConstraint()
        setUpDelegate()
    }
    
    func setUPApi() {
        APIManager.shared.getData(
            urlEndpointString: Constant.getTeam,
            responseDataType: APIModel<teamResponseModel>?.self,
            requestDataType: teamRequestModel.self,
            parameter: nil) { response in
                print(response?.result)
                if let result = response?.result?.teams {
                    self.teams = result
                    self.myTeamTableView.reloadData()
                }
            }
    }
    
    private func setUpUI() {
        view.backgroundColor = gray02
    }
    
    private func setUpLayout() {
        [
            logoImageView,
            myTeamLabel,
            alertButton,
            myTeamTableView
        ].forEach { view.addSubview($0) }
    }
    
    private func setUpConstraint() {
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(63)
            $0.left.equalToSuperview().offset(-12)
            $0.height.equalTo(25)
        }
        
        myTeamLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(logoImageView.snp.centerY)
        }
        
        alertButton.snp.makeConstraints {
            $0.centerY.equalTo(logoImageView.snp.centerY)
            $0.right.equalToSuperview().offset(-16)
        }
        
        myTeamTableView.snp.makeConstraints {
            $0.top.equalTo(myTeamLabel.snp.bottom).offset(16)
            $0.left.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    private func setUpDelegate() {
        self.myTeamTableView.delegate = self
        self.myTeamTableView.dataSource = self
    }

}

/// 리뷰 목록 구현을 위한 Delegate와 DataSource 구현
extension MyTeamVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if teams.count != 0 {
            return teams.count
        }
        return 0
    }
    
    /// 데이터 삽입 구현
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTeamTableView.dequeueReusableCell(withIdentifier: MyTeamTableViewCell().cellID, for: indexPath) as! MyTeamTableViewCell
        
        
//        cell.backgroundColor = gray02
        if !(teams.isEmpty) {
            let team = teams[indexPath.row]
            cell.configure(title: team.name, howManyMember: team.maxMember, startedAt: team.startedAt, endedAt: team.endedAt)
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var res: TeamInfoResponseModel?
        
        APIManager.shared.getData(
            //urlEndpointString: "/teams/:\(teams[indexPath.row].id)",
            urlEndpointString: "/teams/asdf",
            responseDataType: APIModel<TeamInfoResponseModel>?.self,
            requestDataType: TeamInfoRequestModel.self,
            parameter: nil) { response in
                print(response)
                res = (response?.result)!
                print(res)
                
                // 일정 유무와 시간 설정 유무에 따라 분기 처리
                if self.teams.isEmpty {
                    let NextVC = EmptyMeetVC()
                    NextVC.modalPresentationStyle = .fullScreen
                    self.present(NextVC, animated: true)
                }
                else if !self.teams.isEmpty && self.teams[indexPath.row].startedAt.isEmpty {
                    let NextVC = WaitTimeSelectVC()
                    NextVC.modalPresentationStyle = .fullScreen
                    self.present(NextVC, animated: true)
                }
                else {
                    let NextVC = MyTeamDetailVC()
                    NextVC.modalPresentationStyle = .fullScreen
                    NextVC.teamNameLabel.text = res?.meets.meeting?.team.name
                    NextVC.meetLabel.text = res?.meets.meeting?.name
                    NextVC.teamMemberCountLabel.text = "\(res?.meets.meeting?.team.maxMember ?? 0)명"
                    
                    let date = res?.meets.meeting?.dateTime
                    
                    NextVC.dateButton.setTitle(self.formatTimeRange(date: date!), for: UIControl.State.normal)
                    NextVC.noticeContentLabel.text = res?.meets.previously[0].announcement?.content
                    NextVC.previousMeet = res?.meets.previously
                    
                    self.present(NextVC, animated: true)
                }
            }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func formatTimeRange(date: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR") // 한국 로케일 설정
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        if let endDate = dateFormatter.date(from: date) {

            dateFormatter.dateFormat = "yyyy.MM.dd a h:m"
            let formattedEndDate = dateFormatter.string(from: endDate)

            return "\(formattedEndDate)"
        }

        return nil
    }
}

import SwiftUI
@available(iOS 16.0, *)
struct MyTeamVC_Preview: PreviewProvider {
    static var previews: some View {
        MyTeamVC().toPreview()
            //.edgesIgnoringSafeArea(.all)
    }
}
