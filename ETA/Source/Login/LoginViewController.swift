//
//  LoginViewController.swift
//  ETA
//
//  Created by 장준모 on 11/25/23.
//

import UIKit
import SnapKit
import Then

class LoginViewController: UIViewController {
    
    // MARK: Variables
    
    let logoImageView: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "LogoOrange")
        $0.contentMode = .scaleAspectFit
    }
    
    let infoLabel: UILabel = UILabel().then{
        $0.text = "어서오세요! 밋타의 행성에서 \n즐거운 회의 되세요 :)"
        $0.font = h1
        $0.textColor = .black
        $0.numberOfLines = 2
    }
    
    let idLabel: UILabel = UILabel().then{
        $0.text = "아이디"
        $0.font = subTitle01
        $0.textColor = .black
    }
    
    let passwordLabel: UILabel = UILabel().then{
        $0.text = "비밀번호"
        $0.font = subTitle01
        $0.textColor = .black
    }
    
    var idTextField: UITextField = UITextField().then{
        $0.placeholder = "아이디를 입력해주세요."
        $0.backgroundColor = .white
//        $0.
        $0.font = subTitle03
    }
    
    var passwordTextField: UITextField = UITextField().then{
        $0.placeholder = "비밀번호를 입력해주세요."
        $0.font = subTitle03
    }
    
    var loginButton: UIButton = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = subTitle01
        $0.backgroundColor = primary
        $0.layer.cornerRadius = 8
        $0.addTarget(self, action: #selector(didLoginButtonTapped), for: .touchUpInside)
    }
    
    // MARK: viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
                setUpView()
                setUpLayout()
                setUpConstraint()
        //setUpDelegate()
    }
    
    
    // MARK: View
    
    func setUpView() {
        view.backgroundColor = gray02
    }
    
    
    // MARK: Layout
    
    func setUpLayout() {
        [
            logoImageView,
            infoLabel,
            idLabel,
            idTextField,
            passwordLabel,
            passwordTextField,
            loginButton
        ].forEach { self.view.addSubview($0) }
        
        
    }
    
    // MARK: Delegate
    
    func setUpDelegate() {
        
    }
    
    
    // MARK: Constraint
    
    func setUpConstraint() {
        
        logoImageView.snp.makeConstraints{
            $0.centerY.equalToSuperview().multipliedBy(0.3)
            $0.leading.equalToSuperview().offset(20)
        }
        infoLabel.snp.makeConstraints{
            $0.top.equalTo(logoImageView.snp.bottom).offset(30)
            $0.leading.equalTo(logoImageView)
        }
        idLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview().multipliedBy(0.9)
            $0.leading.equalTo(logoImageView)
        }
        idTextField.snp.makeConstraints{
            $0.top.equalTo(idLabel.snp.bottom).offset(10)
            $0.leading.equalTo(logoImageView)
        }
        
        
    }
    
    // MARK: Function

    @objc func didLoginButtonTapped() {
        
    }

}

import SwiftUI
@available(iOS 16.0, *)
struct LoginViewController_Preview: PreviewProvider {
    static var previews: some View {
        LoginViewController().toPreview()
            //.edgesIgnoringSafeArea(.all)
    }
}
