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
        $0.textColor = .black
        $0.numberOfLines = 2
    }
    let logoImageView: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "Logo")
        $0.contentMode = .scaleAspectFit
    }
    
    let halfBackgroundView: UIView = UIView().then {
        $0.frame = CGRect(x: 0, y: 0, width: 393, height: 298)
        
    }
    
    let gradientLayer: CAGradientLayer = CAGradientLayer().then{
        $0.colors = [UIColor(red: 1, green: 0.444, blue: 0.073, alpha: 1).cgColor,
                     UIColor(red: 1, green: 0.722, blue: 0, alpha: 1).cgColor
        ]
        $0.locations = [0, 1]
        $0.startPoint = CGPoint(x: 0.25, y: 0.5)
        $0.endPoint = CGPoint(x: 0.75, y: 0.5)
        $0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0.78, b: -1.29, c: 1.14, d: -0.01, tx: -0.22, ty: 0.73))
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
    }
            
            
    func setUpConstraint() {
        
        infoLabel.snp.makeConstraints{
            $0.width.equalTo(179)
            $0.centerY.equalToSuperview().multipliedBy(0.3)
            $0.leading.equalToSuperview().offset(20)
        }
        logoImageView.snp.makeConstraints{
            $0.width.equalTo(94)
            $0.height.equalTo(90)
            $0.trailing.equalToSuperview().offset(0)
            $0.top.equalToSuperview().offset(71)
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
