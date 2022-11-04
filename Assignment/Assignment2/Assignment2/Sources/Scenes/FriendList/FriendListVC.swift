//
//  FriendListVC.swift
//  Assignment2
//
//  Created by 김담인 on 2022/10/13.
//

import UIKit
import SnapKit
import Then

final class FriendListVC: BaseVC {
    
    // MARK: - Properties
    private let friendListView = FriendListView()
    
    // MARK: - View Life Cycle
    override func loadView() {
        self.view = friendListView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        setAddTarget()
    }
    
    // MARK: - Function
    
    /// login 뷰에서 진입시 friendList를 루트뷰로 재설정 해준 코드
//    private func resetRootView() {
//        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
//        sceneDelegate.window?.rootViewController = self
//    }
    
    private func setAddTarget() {
        friendListView.myProfileImageButton.addTarget(self, action: #selector(presentToProfileVC), for: .touchUpInside)
    }
    
    @objc private func presentToProfileVC() {
        let profileVC = ProfileVC()
        profileVC.modalPresentationStyle = .fullScreen
        self.present(profileVC, animated: true, completion: nil)
    }
    
    private func register() {
        friendListView.friendTableView.delegate = self
        friendListView.friendTableView.dataSource = self
        
        friendListView.friendTableView.register(FriendTableViewCell.self, forCellReuseIdentifier: FriendTableViewCell.identifier)
    }
}

extension FriendListVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProfileModel.friendList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let friendCell = tableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.identifier, for: indexPath) as? FriendTableViewCell else { return UITableViewCell() }

        friendCell.dataBind(model: ProfileModel.friendList[indexPath.row])
        return friendCell
    }

}
