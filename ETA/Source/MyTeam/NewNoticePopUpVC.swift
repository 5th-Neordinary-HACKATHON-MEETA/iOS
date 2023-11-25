//
//  NewNoticePopUpVC.swift
//  ETA
//
//  Created by YOUJIM on 11/26/23.
//

import UIKit

import SnapKit
import Then

class NewNoticePopUpVC: UIViewController {
    
    
    // MARK: Variable
    
    var popUpView: UIView = UIView().then {
        $0.backgroundColor = .white
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
    }
    
    var noticeInfoLabel: UILabel = UILabel().then {
        $0.font = h1
        $0.text = "새로운 공지사항 등록"
        $0.textColor = gray09
    }
    
    var popButton: UIButton = UIButton().then {
        $0.setImage(UIImage(systemName: "xmark"), for: .normal)
        $0.tintColor = gray05
        $0.addTarget(self, action: #selector(didPopButtonTapped), for: .touchUpInside)
    }
    
//    var textBackgroundView: UIView = UIView().then {
//
//    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        setUpLayout()
        setUpDelegate()
        setUpConstraint()
    }
    

    // MARK: View
    
    func setUpView() {
        
    }
    
    
    // MARK: Layout
    
    func setUpLayout() {
        [
            
        ].forEach { view.addSubview($0) }
    }
    
    // MARK: Delegate
    
    func setUpDelegate() {
        
    }
    
    
    // MARK: Constraint
    
    func setUpConstraint() {
        
    }
    
    
    // MARK: Function
    
    @objc func didPopButtonTapped() {
        self.dismiss(animated: true)
    }
}
