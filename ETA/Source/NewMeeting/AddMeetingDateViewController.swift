//
//  AddMeetingDateViewController.swift
//  ETA
//
//  Created by 장준모 on 11/25/23.
//

import UIKit

class AddMeetingDateViewController: UIViewController {

    // MARK: Variables
    
    let meetDateLabel: UILabel = UILabel().then{
        $0.text = "회의가 가능한 날짜를 선택해주세요."
        $0.font = subTitle01
    }
    
    var calendarView: UIDatePicker = UIDatePicker().then {
        $0.datePickerMode = .dateAndTime
        
        $0.preferredDatePickerStyle = .inline
        $0.maximumDate = .distantFuture
        $0.timeZone = .current
        $0.tintColor = primary
        $0.locale = Locale(identifier: "ko_KR")
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 12
        $0.layer.masksToBounds = true
        
//        $0.addTarget(self, action: #selector(didFeedCalendarViewValueChanged), for: .valueChanged)
    }
    
    var completionButton: UIButton = UIButton().then {
        $0.setTitle("완료", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = primary
        
        $0.titleLabel?.font = subTitle01
        $0.layer.cornerRadius = 12
        $0.addTarget(self, action: #selector(didCompletionButtonTapped), for: .touchUpInside)
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
            meetDateLabel,
            calendarView,
            completionButton,
        ].forEach{ view.addSubview($0)}
    }
    
    // MARK: Delegate
    
    func setUpDelegate() {
        
    }
    
    
    // MARK: Constraint
    
    func setUpConstraint() {
        meetDateLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(30)
            $0.leading.equalTo(16)
        }
        calendarView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.top.equalTo(meetDateLabel.snp.bottom).offset(16)
            $0.width.equalTo(360)
        }
        completionButton.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(42)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(52)
        }
    }
    
    // MARK: Function

    @objc func didCompletionButtonTapped() {
        //TODO: API 연결
    }

}

import SwiftUI
@available(iOS 16.0, *)
struct AddMeetingDateViewController_Preview: PreviewProvider {
    static var previews: some View {
        AddMeetingDateViewController().toPreview()
            //.edgesIgnoringSafeArea(.all)
    }
}
