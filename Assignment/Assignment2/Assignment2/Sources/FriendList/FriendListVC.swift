//
//  FriendListVC.swift
//  Assignment2
//
//  Created by 김담인 on 2022/10/13.
//

import UIKit

final class FriendListVC: BaseVC {
    
    // MARK: - Properties
    private let friendListView = FriendListView()
    
    // MARK: - View Life Cycle
    override func loadView() {
        resetRootView()
        self.view = friendListView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAddTarget()
    }
    
    // MARK: - Function
    private func resetRootView() {
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
        sceneDelegate.window?.rootViewController = self
    }
    
    private func setAddTarget() {
        friendListView.profileImageButton.addTarget(self, action: #selector(presentToProfileVC), for: .touchUpInside)
    }
    
    @objc private func presentToProfileVC() {
        let profileVC = ProfileVC()
        profileVC.modalPresentationStyle = .fullScreen
        self.present(profileVC, animated: true, completion: nil)
    }
}
