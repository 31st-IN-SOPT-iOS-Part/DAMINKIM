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
        chatListView.chatCollectionView.delegate = self
        chatListView.chatCollectionView.dataSource = self
        
        chatListView.chatCollectionView.register(ChatListCollectionViewCell.self, forCellWithReuseIdentifier: ChatListCollectionViewCell.identifier)
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

extension ChatListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ProfileModel.friendList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let chatCell = collectionView.dequeueReusableCell(withReuseIdentifier: ChatListCollectionViewCell.identifier, for: indexPath) as? ChatListCollectionViewCell else {return UICollectionViewCell()}
        chatCell.dataBind(model: ProfileModel.friendList[indexPath.item])
        return chatCell
    }
}

extension ChatListVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let doubleCellWidth = screenWidth - chatListView.kChatInset.left - chatListView.kChatInset.right - chatListView.kChatInterItemSpacing
        return CGSize(width: doubleCellWidth, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return chatListView.kChatLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return chatListView.kChatInterItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return chatListView.kChatInset
    }
}

