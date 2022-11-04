//
//  ChatLsitView.swift
//  Assignment2
//
//  Created by 김담인 on 2022/11/04.
//

import UIKit
import SnapKit
import Then

final class ChatListView: BaseView {
    
    // MARK: - Properties
    private let headerView = UIView()
    
    private let chattingButton = UIButton().then{
        $0.setTitle("채팅", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        $0.setTitleColor(.black, for: .normal)
    }
    
    private let openChattingButton = UIButton().then{
        $0.setTitle("오픈채팅", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        $0.setTitleColor(.black, for: .normal)
        $0.setTitleColor(.gray, for: .disabled)
        $0.isEnabled = false
    }
    
    let addButton = UIButton().then {
        $0.setBackgroundImage(UIImage(systemName: "plus"), for: .normal)
        $0.tintColor = .black
        $0.imageView?.contentMode = .scaleToFill
    }
    
    private let settingButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named:"settingImage"), for: .normal)
        $0.imageView?.contentMode = .scaleAspectFill
    }
    
    private let chatBannerButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "chatTabBannerImage"), for: .normal)
        
    }
    
    lazy var chatTableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.separatorStyle = .singleLine
        $0.separatorColor = .black.withAlphaComponent(0.1)
    }
    
    // MARK: - Function
    override func setupView() {
        self.addSubviews([headerView, chatBannerButton, chatTableView])
        
        headerView.addSubViews([chattingButton, openChattingButton,addButton, settingButton])
        
    }
    
    override func setupLayout() {
        headerView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.equalTo(safeAreaLayoutGuide).offset(14)
            $0.trailing.equalTo(safeAreaLayoutGuide).offset(-14)
            $0.height.equalTo(52)
        }
        
        /// headerView 레이아웃
        chattingButton.snp.makeConstraints {
            $0.leading.centerY.equalToSuperview()
        }
        
        openChattingButton.snp.makeConstraints {
            $0.leading.equalTo(chattingButton.snp.trailing).offset(7)
            $0.centerY.equalToSuperview()
        }
        
        settingButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        addButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(settingButton.snp.leading).offset(-12)
        }
        
        chatBannerButton.snp.makeConstraints {
            $0.leading.equalTo(safeAreaLayoutGuide).offset(16)
            $0.trailing.equalTo(safeAreaLayoutGuide).offset(-16)
            $0.top.equalTo(headerView.snp.bottom)
            $0.height.equalTo(71)
        }
        
        chatTableView.snp.makeConstraints {
            $0.top.equalTo(chatBannerButton.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
            /// firiendList랑 같은 더미 사용
            $0.height.equalTo(70 * ProfileModel.friendList.count)
        }
    }
}
