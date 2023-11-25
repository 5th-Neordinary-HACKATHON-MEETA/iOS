//
//  AddNewMeetingViewController.swift
//  ETA
//
//  Created by 장준모 on 11/25/23.
//

import UIKit

class AddNewMeetingViewController: UIViewController {

    // MARK: Variables
    
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
    
//    var whatTimeButton: UIButton = UIButton().then{
//        
//    }
    
    
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
        meetSubjectTextField,
        meetSubjectLabel,
        ].forEach{ view.addSubview($0) }
    }
    
    // MARK: Delegate
    
    func setUpDelegate() {
        
    }
    
    
    // MARK: Constraint
    
    func setUpConstraint() {
        meetSubjectLabel.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.leading.equalToSuperview().offset(20)
        }
        meetSubjectTextField.snp.makeConstraints{
            $0.height.equalTo(58)
            $0.top.equalTo(meetSubjectLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(15)
        }
    }
    
    // MARK: Function


}

import SwiftUI
@available(iOS 16.0, *)
struct AddNewMeetingViewController_Preview: PreviewProvider {
    static var previews: some View {
        AddNewMeetingViewController().toPreview()
            //.edgesIgnoringSafeArea(.all)
    }
}
