//
//  TeamTableViewCell.swift
//  ETA
//
//  Created by YOUJIM on 11/26/23.
//

import SwiftUI
import UIKit

import SnapKit
import Then


class TeamTableViewCell: UITableViewCell {
    
    // MARK: Variables
    
    var cellID = "teamCell"
    
    var teamNameLabel: UILabel = UILabel().then {
        $0.text = "Team ETA"
        $0.textColor = gray09
        $0.font = subTitle01
    }
    
    var backView: UIView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 12
    }
    
    var noticeLabel: UILabel = UILabel().then {
        $0.text = "MVP 기능 확정해오기"
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
            teamNameLabel,
            backView,
            noticeLabel,
            authorImageView,
            authorLabel
        ].forEach { self.contentView.addSubview($0) }
    }
    
    // MARK: Delegate
    
    func setUpDelegate() {
        
    }
    
    
    // MARK: Constraint
    
    func setUpConstraint() {
        teamNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview().offset(16)
        }
        
        backView.snp.makeConstraints {
            $0.top.equalTo(teamNameLabel.snp.bottom).offset(16)
            $0.left.equalTo(teamNameLabel)
            $0.right.equalToSuperview().offset(-16)
            $0.height.equalTo(102)
            $0.bottom.equalToSuperview().offset(-30)
        }
        
        noticeLabel.snp.makeConstraints {
            $0.top.equalTo(backView).offset(27)
            $0.left.equalTo(backView).offset(26)
        }
        
        authorImageView.snp.makeConstraints {
            $0.top.equalTo(noticeLabel.snp.bottom).offset(16)
            $0.left.equalTo(noticeLabel)
        }
        
        authorLabel.snp.makeConstraints {
            $0.centerY.equalTo(authorImageView)
            $0.left.equalTo(authorImageView.snp.right).offset(6)
            
        }
    }
}


#if DEBUG

@available(iOS 13.0, *)
struct TeamTableViewCell_Preview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let cell = TeamTableViewCell()
            return cell
        }
        .previewLayout(.sizeThatFits)
        .padding(10)
    }
}
#endif
