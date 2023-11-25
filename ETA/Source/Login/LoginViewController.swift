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
    
    var loginButtonEnabled = false
    
    let logoImageView: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "LogoOrange")
        $0.contentMode = .scaleAspectFit
    }
    
    let infoLabel: UILabel = UILabel().then{
        $0.text = "어서오세요! ETA에서 회의 일정을\n한번에 관리하세요 :)"
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
        $0.layer.cornerRadius = 12
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        $0.leftViewMode = .always
        $0.font = subTitle03
    }
    
    var passwordTextField: UITextField = UITextField().then{
        $0.placeholder = "비밀번호를 입력해주세요."
        $0.font = subTitle03
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 12
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        $0.leftViewMode = .always
        $0.isSecureTextEntry = true
    }
    
    var loginButton: UIButton = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(gray07, for: .normal)
        $0.backgroundColor = gray04
        $0.isEnabled = false
        
        $0.titleLabel?.font = subTitle01
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(didLoginButtonTapped), for: .touchUpInside)
    }
    
    let loginfailLabel: UILabel = UILabel().then{
        $0.text = "로그인에 실패하였습니다."
        $0.font = subTitle03
        $0.textColor = .red
        $0.isHidden = true
    }
    
    // MARK: viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
                setUpView()
                setUpLayout()
                setUpConstraint()
        
        self.idTextField.addTarget(self, action: #selector(self.TFdidChanged(_:)), for: .editingChanged)
        self.passwordTextField.addTarget(self, action: #selector(self.TFdidChanged(_:)), for: .editingChanged)
        
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
            loginButton,
            loginfailLabel
        ].forEach { self.view.addSubview($0) }
        
        
    }
    
    // MARK: Delegate
    
    func setUpDelegate() {
        
    }
    
    
    // MARK: Constraint
    
    func setUpConstraint() {
        
        logoImageView.snp.makeConstraints{
            $0.centerY.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.3)
            $0.leading.equalToSuperview().offset(16)
        }
        infoLabel.snp.makeConstraints{
            $0.top.equalTo(logoImageView.snp.bottom).offset(19)
            $0.leading.equalTo(logoImageView)
        }
        idLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview().multipliedBy(0.8)
            $0.leading.equalTo(logoImageView)
        }
        idTextField.snp.makeConstraints{
            $0.top.equalTo(idLabel.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(60)
        }
        passwordLabel.snp.makeConstraints{
            $0.top.equalTo(idTextField.snp.bottom).offset(39)
            $0.leading.equalTo(logoImageView)
        }
        passwordTextField.snp.makeConstraints{
            $0.top.equalTo(passwordLabel.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(60)
        }
        loginButton.snp.makeConstraints{
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        loginfailLabel.snp.makeConstraints{
            $0.bottom.equalTo(loginButton.snp.top).offset(-10)
            $0.centerX.equalToSuperview()
        }
        
    }
    
    // MARK: Function

    @objc func didLoginButtonTapped() {
        
        APIManager.shared.postData(urlEndpointString: Constant.postAuthLogin, responseDataType: APIModel<LoginResponseModel>.self, requestDataType: LoginRequestModel.self, parameter: LoginRequestModel(id: idTextField.text!, password: passwordTextField.text!), completionHandler: {
            response in
            print(response.self)
            if response.isSuccess ?? false {    //로그인 성공시
                self.loginfailLabel.isHidden = true
                var tabBarController = TabBarController()
                tabBarController.modalPresentationStyle = .fullScreen
                
                self.present(tabBarController, animated: true)
            }
            else{//로그인 실패시
                self.loginfailLabel.isHidden = false
            }
        })
        

    }

    //텍스트필드 값 변경 시 유효성 검사
    @objc func TFdidChanged(_ sender: UITextField) {
        
        print("텍스트 변경 감지")
        print("text :", sender.text ?? "error")
        
        // idTextField와 passwordTextField 모두 값이 비어 있지 않을 때 로그인 버튼 활성화
        if !(idTextField.text?.isEmpty ?? true) && !(passwordTextField.text?.isEmpty ?? true) {
            loginButton.setTitleColor(.white, for: .normal)
            loginButton.backgroundColor = primary
            loginButton.isEnabled = true
        } else {
            // 둘 중 하나라도 비어 있으면 로그인 버튼 비활성화
            loginButton.setTitleColor(gray07, for: .normal)
            loginButton.backgroundColor = gray04
            loginButton.isEnabled = false
        }
        
        
    }//end of T'Fdid'Changed
    
}

import SwiftUI
@available(iOS 16.0, *)
struct LoginViewController_Preview: PreviewProvider {
    static var previews: some View {
        LoginViewController().toPreview()
            //.edgesIgnoringSafeArea(.all)
    }
}
