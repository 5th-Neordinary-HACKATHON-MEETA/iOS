//
//  MyTeamTableViewCell.swift
//  ETA
//
//  Created by YOUJIM on 11/25/23.
//

import SwiftUI
import UIKit

import SnapKit
import Then


class MyTeamTableViewCell: UITableViewCell {
    
    
    // MARK: Variables
    
    var cellID = "myTeamTableViewCell"
    
    var view: UIView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
        $0.layer.shadowColor = UIColor.black.cgColor // 그림자 색상
        $0.layer.shadowOpacity = 0.1 // 그림자 투명도
        $0.layer.shadowOffset = CGSize(width: 0, height: 5) // 그림자 위치
        $0.layer.shadowRadius = 10 // 그림자의 블러 반경
    }
    
    var teamNameLabel: UILabel = UILabel().then {
        $0.font = h1
        $0.textColor = gray09
        $0.text = "TEAM ETA"
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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
        setUpLayout()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: View
    
    func setUpView() {
        self.backgroundColor = .white
    }
    
    
    // MARK: Layout
    
    func setUpLayout() {
        [
            view,
            teamNameLabel,
            teamMemberCountLabel,
            teamMemberCountInfoLabel,
            dateButton
        ].forEach { self.contentView.addSubview($0) }
    }
    
    
    // MARK: Constraint
    
    func setUpConstraint() {
        view.snp.makeConstraints {
            $0.top.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-16)
            $0.bottom.equalToSuperview().offset(-4)
        }
        
        teamNameLabel.snp.makeConstraints {
            $0.top.left.equalTo(view).offset(30)
        }
        
        teamMemberCountLabel.snp.makeConstraints {
            $0.top.equalTo(teamNameLabel.snp.bottom).offset(6)
            $0.left.equalTo(teamNameLabel)
        }
        
        teamMemberCountInfoLabel.snp.makeConstraints {
            $0.centerY.equalTo(teamMemberCountLabel)
            $0.left.equalTo(teamMemberCountLabel.snp.right)
        }
        
        dateButton.snp.makeConstraints {
            $0.top.equalTo(teamMemberCountLabel.snp.bottom).offset(30)
            $0.left.equalTo(teamMemberCountLabel)
            $0.width.equalTo(170)
            $0.bottom.equalToSuperview().offset(-30)
        }
    }
    
    func configure(title: String, howManyMember: Int, startedAt: String, endedAt: String) {
        teamNameLabel.text = title
        teamMemberCountLabel.text = String(howManyMember) + "명"
        if let formattedTimeRange = formatTimeRange(startedAt: startedAt, endedAt: endedAt) {
            let date = formatTimeRange(startedAt: startedAt, endedAt: endedAt)
            dateButton.setTitle(date, for: .normal)
        } else {
            print("날짜 형식 변환 실패")
        }
    }
    
    func formatTimeRange(startedAt: String, endedAt: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR") // 한국 로케일 설정
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        if let startDate = dateFormatter.date(from: startedAt),
           let endDate = dateFormatter.date(from: endedAt) {

            dateFormatter.dateFormat = "yyyy.MM.dd a h:m"
            let formattedStartDate = dateFormatter.string(from: startDate)
            let formattedEndDate = dateFormatter.string(from: endDate)
            
            

            return "\(formattedStartDate)"
        }

        return nil
    }
    
}


#if DEBUG

@available(iOS 13.0, *)
struct MyTeamTableViewCell_Preview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let cell = MyTeamTableViewCell()
            return cell
        }
        .previewLayout(.sizeThatFits)
        .padding(10)
    }
}
#endif
