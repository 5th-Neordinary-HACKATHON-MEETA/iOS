//
//  OnboardingViewController.swift
//  ETA
//
//  Created by 장준모 on 11/25/23.
//

import UIKit

class OnboardingViewController: UIViewController {


    
    // MARK: Variables
    let onboardingImageView: UIImageView = UIImageView().then{
        $0.image = UIImage(named: "Onboarding")
    }
    
    var loginButton: UIButton = UIButton().then {
        $0.setTitle("로그인하기", for: .normal)
        $0.setTitleColor(primary, for: .normal)
        $0.backgroundColor = .white
        
        $0.titleLabel?.font = subTitle01
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(didDoLoginButtonTapped), for: .touchUpInside)
        $0.isUserInteractionEnabled = true
    }
    
    var joinButton: UIButton = UIButton().then {
        $0.setTitle("회원가입하기", for: .normal)
        $0.setTitleColor(primary, for: .normal)
        $0.backgroundColor = .white
        
        $0.titleLabel?.font = subTitle01
        $0.layer.cornerRadius = 10
    }
    
    // MARK: viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        setUpView()
                setUpLayout()
                setUpConstraint()
        //setUpDelegate()
    }
    
    
    // MARK: View
    
    func setUpView() {
        view.backgroundColor = .white
    }
    
    
    // MARK: Layout
    
    func setUpLayout() {
        [
        onboardingImageView,
        loginButton,
        joinButton,
        ].forEach { view.addSubview($0) }
    }
    
    // MARK: Delegate
    
    func setUpDelegate() {
        
    }
    
    
    // MARK: Constraint
    
    func setUpConstraint() {
        onboardingImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints{
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(52)
            $0.centerY.equalToSuperview().multipliedBy(1.2)
        }
        
        joinButton.snp.makeConstraints{
            $0.horizontalEdges.equalTo(loginButton)
            $0.height.equalTo(loginButton)
            $0.top.equalTo(loginButton.snp.bottom).offset(16)
        }
    }
    
    // MARK: Function
    
    @objc func didDoLoginButtonTapped() {
        print("로그인하기 버튼 탭")
        
        navigationController?.pushViewController(LoginViewController(), animated: true)
    }

}

import SwiftUI
@available(iOS 16.0, *)
struct OnboardingViewController_Preview: PreviewProvider {
    static var previews: some View {
        OnboardingViewController().toPreview()
            //.edgesIgnoringSafeArea(.all)
    }
}
