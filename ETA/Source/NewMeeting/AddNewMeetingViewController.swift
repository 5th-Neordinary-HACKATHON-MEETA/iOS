//
//  AddNewMeetingViewController.swift
//  ETA
//
//  Created by 장준모 on 11/25/23.
//

import UIKit

class AddNewMeetingViewController: UIViewController {
    
    // MARK: Variables
    
    var meetModel = MeetingRequestModel.self
    var teamId: Int?
    var whatTime: Int = 0
    
    var previousButton: UIButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        $0.tintColor = gray09
        $0.addTarget(self, action: #selector(didPreButtonTapped), for: .touchUpInside)
    }
    
    var teamNameLabel: UILabel = UILabel().then {
        $0.font = subTitle01
        $0.text = "새 회의 만들기"
        $0.textColor = gray09
    }
    
    let meetSubjectLabel: UILabel = UILabel().then{
        $0.text = "새로운 회의의 주제를 알려주세요."
        $0.font = subTitle01
    }
    var meetSubjectTextField: UITextField = UITextField().then{
        $0.placeholder = "회의 주제를 입력해주세요."
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 12
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        $0.leftViewMode = .always
        $0.font = subTitle03
    }
    
    let whatTimeLabel: UILabel = UILabel().then{
        $0.text = "몇 시간 동안 진행될 예정인가요?"
        $0.font = subTitle01
    }
    
    let whatTimeButton: UIButton = UIButton().then{
        $0.setTitle("1시간", for: .normal)
        $0.setTitleColor(gray09, for: .normal)
        $0.backgroundColor = .white
        $0.contentHorizontalAlignment = .left
        $0.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        
        $0.layer.cornerRadius = 10
        $0.menu = UIMenu(children: [
            UIAction(title: "1시간", state: .on, handler: { _ in print("1시간")}),
            UIAction(title: "2시간", handler: { _ in print("2시간")}),
            UIAction(title: "3시간", handler: { _ in print("3시간")}),
            UIAction(title: "4시간", handler: { _ in print("4시간")}),
            UIAction(title: "5시간", handler: { _ in print("5시간")}),
        ])
        /// 터치하면 바로 메뉴 나오도록 설정
        $0.showsMenuAsPrimaryAction = true
        /// 체크 표시 하나만 할 수 있도록 설정
        $0.changesSelectionAsPrimaryAction = true
    }
    
    let arrowImageView: UIImageView = UIImageView().then{
        $0.image = UIImage(named: "icon-arrow-decrease-mono")
        $0.isUserInteractionEnabled = false
    }
    
    var checkButton: UIButton = UIButton().then {
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(gray07, for: .normal)
        $0.backgroundColor = gray04
        $0.isEnabled = false
        
        $0.titleLabel?.font = subTitle01
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(didCheckButtonTapped), for: .touchUpInside)
    }
    
    
    
    // MARK: viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        setUpLayout()
        setUpConstraint()
        //setUpDelegate()
        self.meetSubjectTextField.addTarget(self, action: #selector(self.TFdidChanged(_:)), for: .editingChanged)

        hideKeyboard()
    }
    
    
    // MARK: View
    
    func setUpView() {
        view.backgroundColor = gray02
    }
    
    
    // MARK: Layout
    
    func setUpLayout() {
        [
            previousButton,
            teamNameLabel,
            meetSubjectTextField,
            meetSubjectLabel,
            whatTimeLabel,
            whatTimeButton,
            arrowImageView,
            checkButton
        ].forEach{ view.addSubview($0) }
    }
    
    // MARK: Delegate
    
    func setUpDelegate() {
        
    }
    
    
    // MARK: Constraint
    
    func setUpConstraint() {
        previousButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(64)
            $0.left.equalToSuperview().offset(16)
        }
        
        teamNameLabel.snp.makeConstraints {
            $0.centerY.equalTo(previousButton)
            $0.centerX.equalToSuperview()
        }
        meetSubjectLabel.snp.makeConstraints{
            $0.top.equalTo(previousButton.snp.bottom).offset(38)
            $0.leading.equalToSuperview().offset(20)
        }
        meetSubjectTextField.snp.makeConstraints{
            $0.height.equalTo(58)
            $0.top.equalTo(meetSubjectLabel.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(15)
        }
        whatTimeLabel.snp.makeConstraints{
            $0.leading.equalTo(meetSubjectLabel)
            $0.top.equalTo(meetSubjectTextField.snp.bottom).offset(30)
        }
        whatTimeButton.snp.makeConstraints{
            $0.top.equalTo(whatTimeLabel.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(15)
            $0.height.equalTo(58)
        }
        arrowImageView.snp.makeConstraints{
            $0.centerY.equalTo(whatTimeButton)
            $0.trailing.equalTo(whatTimeButton.snp.trailing).inset(20)
        }
        checkButton.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(42)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(52)
        }
        
    }
    
    // MARK: Function
    
    @objc func didCheckButtonTapped() {
        
        APIManager.shared.postData(urlEndpointString: Constant.postMeet, responseDataType: APIModel<MeetingResponseModel>.self, requestDataType: MeetingRequestModel.self, parameter: MeetingRequestModel(name: meetSubjectTextField.text ?? "good", teamId: "임시", duration: changeTimeToInt()), completionHandler: {
            response in
            print(response.self)
            self.dismiss(animated: true)
        })
        self.dismiss(animated: true)
    }
    
    func changeTimeToInt() -> Int {
        let x = whatTimeButton.currentTitle?.prefix(1)
        let y = Int(x ?? "1")!
        
        return y
    }
    
    @objc func didPreButtonTapped() {
        self.dismiss(animated: true)
    }
    
    //텍스트필드 값 변경 시 유효성 검사
    @objc func TFdidChanged(_ sender: UITextField) {
        
        print("텍스트 변경 감지")
        print("text :", sender.text ?? "error")
        
        // idTextField와 passwordTextField 모두 값이 비어 있지 않을 때 로그인 버튼 활성화
        if !(meetSubjectTextField.text?.isEmpty ?? true) {
            checkButton.setTitleColor(.white, for: .normal)
            checkButton.backgroundColor = primary
            checkButton.isEnabled = true
        } else {
            // 둘 중 하나라도 비어 있으면 로그인 버튼 비활성화
            checkButton.setTitleColor(gray07, for: .normal)
            checkButton.backgroundColor = gray04
            checkButton.isEnabled = false
        }
    }
}


import SwiftUI
@available(iOS 16.0, *)
struct AddNewMeetingViewController_Preview: PreviewProvider {
    static var previews: some View {
        AddNewMeetingViewController().toPreview()
            //.edgesIgnoringSafeArea(.all)
    }
}

