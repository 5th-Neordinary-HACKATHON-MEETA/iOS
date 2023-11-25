//
//  HomeViewController.swift
//  ETA
//
//  Created by 윤지성 on 11/25/23.
//

import UIKit
import SnapKit
import Then

class HomeViewController: UIViewController {
    
    let infoLabel: UILabel = UILabel().then {
        $0.text = "밋타와 함께하는 즐거운 회의 시간 :)"
        $0.font = h1
        $0.textColor = .white
        $0.numberOfLines = 2
    }
    let logoImageView: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "LogoGrey")
        $0.contentMode = .scaleAspectFill
    }
    

    let halfBackgroundView: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "OrangeGradient")
        $0.contentMode = .scaleAspectFit
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpLayout()
        setUpConstraint()
        
    }
        
    func setUpLayout() {
        [
            infoLabel,
            halfBackgroundView,
            logoImageView
        ].forEach { self.view.addSubview($0) }
        
        halfBackgroundView.addSubview(infoLabel)
        halfBackgroundView.addSubview(logoImageView)
    }
            
            
    func setUpConstraint() {
        halfBackgroundView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(0)
            $0.trailing.equalToSuperview().offset(0)
            $0.top.equalToSuperview().offset(0)
            $0.height.equalTo(298)

        }
        
        logoImageView.snp.makeConstraints{
            $0.width.equalTo(171)
            $0.height.equalTo(141)
            $0.trailing.equalToSuperview().offset(20)
            $0.top.equalToSuperview().offset(71)
        }
        
        infoLabel.snp.makeConstraints{
            $0.top.equalTo(halfBackgroundView.snp.top).offset(30)
            $0.width.equalTo(179)
            $0.centerY.equalToSuperview().multipliedBy(0.3)
            $0.leading.equalToSuperview().offset(20)
        }
        
    }
            
            
            //        var parent = self.view!
            //        parent.addSubview(halfBackgroundView)
            //        halfBackgroundView.translatesAutoresizingMaskIntoConstraints = false
            //        halfBackgroundView.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 0).isActive = true
            //        halfBackgroundView.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: 0).isActive = true
            //        halfBackgroundView.topAnchor.constraint(equalTo: parent.topAnchor, constant: 0).isActive = true
            //
            //        // Set the height of halfBackgroundView to 35% of the parent view's height
            //        let heightConstraint = halfBackgroundView.heightAnchor.constraint(equalTo: parent.heightAnchor, multiplier: 0.35)
            //        heightConstraint.isActive = true
            
}

import SwiftUI
@available(iOS 16.0, *)
struct HomeViewController_Preview: PreviewProvider {
    static var previews: some View {
        HomeViewController().toPreview()
            //.edgesIgnoringSafeArea(.all)
    }
}
