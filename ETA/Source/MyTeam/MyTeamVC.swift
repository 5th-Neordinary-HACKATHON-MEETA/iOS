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
        return 2
    }
    
    /// 데이터 삽입 구현
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTeamTableView.dequeueReusableCell(withIdentifier: MyTeamTableViewCell().cellID, for: indexPath) as! MyTeamTableViewCell
        
        cell.selectionStyle = .none
        cell.backgroundColor = gray02
        
        return cell
    }
    
    // TODO: 일정 유무와 시간 설정 유무에 따라 분기 처리 필요
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let NextVC = MyTeamDetailVC()
        
        NextVC.modalPresentationStyle = .fullScreen
        
        self.present(NextVC, animated: true)
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
