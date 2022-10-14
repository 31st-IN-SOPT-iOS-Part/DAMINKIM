//
//  WelcomeVC.swift
//  Assignment2
//
//  Created by 김담인 on 2022/10/12.
//

import UIKit

final class WelcomeVC: BaseVC {
    
    // MARK: - Properties
    let welcomeView = WelcomeView()
    var userID: String?
    
    // MARK: - View Life Cycle
    override func loadView() {
        self.view = welcomeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAddTarget()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: - Function
    func setUserID() {
        if let id = userID {
            welcomeView.welcomeMessage.text = "\(id)님 \n환영합니다"
        }
    }
    
    private func setAddTarget() {
        welcomeView.completionButton.addTarget(self, action: #selector(pushToFriendListVC), for: .touchUpInside)
    }
    
    @objc func pushToFriendListVC() {
        let rootVC = FriendListVC()
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
        sceneDelegate.window?.rootViewController = rootVC
        self.navigationController?.pushViewController(rootVC, animated: true)
    }
    
    
}
