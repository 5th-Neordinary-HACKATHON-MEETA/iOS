//
//  VotedTeamMemberCollectionViewCell.swift
//  ETA
//
//  Created by YOUJIM on 11/26/23.
//

import UIKit
import SwiftUI

import SnapKit
import Then


class VotedTeamMemberCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
        setUpLayout()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Variables
    
    static let cellID = "votedTeamMemberCell"
    
    var memberButton: UIButton = UIButton().then {
        $0.setTitle("짐깅", for: .normal)
        $0.setTitleColor(primary, for: .normal)
        $0.titleLabel?.font = body02
        $0.layer.cornerRadius = 14
        $0.layer.borderColor = primary?.cgColor
        $0.layer.borderWidth = 0.8
    }
    
    
    // MARK: View
    
    func setUpView() {
        
    }
    
    
    // MARK: Layout
    
    func setUpLayout() {
        [
            memberButton
        ].forEach{ self.contentView.addSubview($0) }
    }
    
    // MARK: Delegate
    
    func setUpDelegate() {
        
    }
    
    
    // MARK: Constraint
    
    func setUpConstraint() {
        memberButton.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}

//#if DEBUG
//
//@available(iOS 13.0, *)
//struct VisitReviewPhotoCollectionViewCell_Preview: PreviewProvider {
//    static var previews: some View {
//        UIViewPreview {
//            let cell = VisitReviewPhotoCollectionViewCell()
//            return cell
//        }
//        .previewLayout(.sizeThatFits)
//        .padding(10)
//    }
//}
//#endif

