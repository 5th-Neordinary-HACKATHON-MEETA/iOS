//
//  PreviousMeetTableViewCell.swift
//  ETA
//
//  Created by YOUJIM on 11/25/23.
//

import SwiftUI
import UIKit

import SnapKit
import Then


class PreviousMeetTableViewCell: UITableViewCell {
    
    // MARK: Variables
    
    var cellID = "previousMeetCell"
    
    var backView: UIView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 12
    }
    
    var meetLabel: UILabel = UILabel().then {
        $0.text = "와이어프레임 회의"
        $0.font = subTitle01
        $0.textColor = gray09
    }
    
    var teamMemberCountLabel: UILabel = UILabel().then {
        $0.font = body02
        $0.text = "9명"
        $0.textColor = primary
    }
    
    var teamMemberCountInfoLabel: UILabel = UILabel().then {
        $0.font = body02
        $0.text = "이 회의에 참여했어요!"
        $0.textColor = gray07
    }
    
    var dateLabel: UILabel = UILabel().then {
        $0.font = body02
        $0.text = "2023.11.27 오후 7시~8시"
        $0.textColor = gray07
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
        setUpLayout()
        setUpDelegate()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: View
    
    func setUpView() {
        
    }
    
    
    // MARK: Layout
    
    func setUpLayout() {
        [
            backView,
            meetLabel,
            teamMemberCountLabel,
            teamMemberCountInfoLabel,
            dateLabel
        ].forEach { self.contentView.addSubview($0) }
    }
    
    // MARK: Delegate
    
    func setUpDelegate() {
        
    }
    
    
    // MARK: Constraint
    
    func setUpConstraint() {
        backView.snp.makeConstraints {
            $0.left.top.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-16)
            $0.bottom.equalToSuperview().offset(-4)
        }
        
        meetLabel.snp.makeConstraints {
            $0.top.equalTo(backView.snp.top).offset(31)
            $0.left.equalTo(backView).offset(26)
        }
        
        teamMemberCountLabel.snp.makeConstraints {
            $0.top.equalTo(backView).offset(26)
            $0.left.equalTo(meetLabel.snp.right).offset(15)
        }
        
        teamMemberCountInfoLabel.snp.makeConstraints {
            $0.centerY.equalTo(teamMemberCountLabel)
            $0.left.equalTo(teamMemberCountLabel.snp.right)
        }
        
        dateLabel.snp.makeConstraints {
            $0.left.equalTo(teamMemberCountLabel)
            $0.top.equalTo(teamMemberCountLabel.snp.bottom)
            $0.bottom.equalTo(backView.snp.bottom).offset(-24)
        }
    }
}


#if DEBUG

@available(iOS 13.0, *)
struct PreviousMeetTableViewCell_Preview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let cell = PreviousMeetTableViewCell()
            return cell
        }
        .previewLayout(.sizeThatFits)
        .padding(10)
    }
}
#endif
