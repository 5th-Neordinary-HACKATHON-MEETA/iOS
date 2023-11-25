//
//  TabBarController.swift
//  ETA
//
//  Created by YOUJIM on 11/25/23.
//

import UIKit

// MARK: - 메인 들어가면 표시되는 탭바 컨트롤러 구현 화면

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = primary
        
        // MARK: Variables
        
        let mainVC = HomeViewController()
        mainVC.tabBarItem.title = "홈"
        mainVC.tabBarItem.image = UIImage(named: "MainTab")
        mainVC.tabBarItem.selectedImage = UIImage(named: "MainTab")
        
        let myTeamVC = MyTeamVC()
        myTeamVC.tabBarItem.title = "나의 팀"
        myTeamVC.tabBarItem.image = UIImage(named: "MyTeamTab")
        myTeamVC.tabBarItem.selectedImage = UIImage(named: "MyTeamTab")
        
        let noticeVC = NoticeVC()
        noticeVC.tabBarItem.title = "공지사항"
        noticeVC.tabBarItem.image = UIImage(named: "NoticeTab")
        noticeVC.tabBarItem.selectedImage = UIImage(named: "NoticeTab")
        
        let mainNavigationController = UINavigationController(rootViewController: mainVC)
        let myTeamNavigationController = UINavigationController(rootViewController: myTeamVC)
        let noticeNavigationController = UINavigationController(rootViewController: noticeVC)
        
        
        // MARK: Navigation Bar 커스텀
        [
            mainNavigationController,
            myTeamNavigationController,
            noticeNavigationController
        ].forEach { $0.navigationBar.tintColor = .black}
        
        setViewControllers([mainNavigationController,
                            myTeamNavigationController,
                            noticeNavigationController], animated: true)
    }
}


