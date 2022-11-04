//
//  ChatListVC.swift
//  Assignment2
//
//  Created by 김담인 on 2022/11/04.
//

import UIKit

class ChatListVC: BaseVC {
    
    // MARK: - Properties
    private let chatListView = ChatListView()
    
    // MARK: - View Life Cycle
    override func loadView() {
        self.view = chatListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        setAddTarget()
    }
    
    // MARK: - Function
    private func register() {
        chatListView.chatTableView.delegate = self
        chatListView.chatTableView.dataSource = self
        
        chatListView.chatTableView.register(ChatListTableViewCell.self, forCellReuseIdentifier: ChatListTableViewCell.identifier)
    }
    
    private func setAddTarget() {
        chatListView.addButton.addTarget(self, action: #selector(presentToPhotoGridVC), for: .touchUpInside)
    }
    
    @objc private func presentToPhotoGridVC() {
        let photoGridVC = PhotoGridVC()
        photoGridVC.modalPresentationStyle = .fullScreen
        self.present(photoGridVC, animated: true, completion: nil)
    }

}
extension ChatListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

extension ChatListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ProfileModel.friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let chatListCell = tableView.dequeueReusableCell(withIdentifier: ChatListTableViewCell.identifier, for: indexPath) as? ChatListTableViewCell else { return UITableViewCell() }
        
        chatListCell.dataBind(model: ProfileModel.friendList[indexPath.row])
        return chatListCell
    }
}
