//
//  ChatListTableViewCell.swift
//  Assignment2
//
//  Created by 김담인 on 2022/11/04.
//

import UIKit
import SnapKit
import Then

final class ChatListTableViewCell: UITableViewCell {
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties
    static let identifier = "ChatListTableViewCell"
    
    private let chatRoomImageView = UIImageView()
    private let chatRoomNameLabel = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
    }
    private let chatRoomCurrentMessage = UILabel().then {
        $0.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 11)
    }
    
    private let chatMessageTime = UILabel().then {
        $0.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 8)
    }
    
    // MARK: - Function
    func dataBind(model: ProfileModel) {
        chatRoomImageView.image = UIImage(named: model.profileImageTitle)
        chatRoomNameLabel.text = model.profileName
        chatRoomCurrentMessage.text = model.profileStatusMessage
    }
    
    private func setupLayout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        self.addSubviews([chatRoomImageView, chatRoomNameLabel, chatRoomCurrentMessage, chatMessageTime])
        
        chatRoomImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(44)
        }
        
        chatRoomNameLabel.snp.makeConstraints {
            $0.leading.equalTo(chatRoomImageView.snp.trailing).offset(20)
            $0.top.equalToSuperview().offset(10)
        }
        
        chatRoomCurrentMessage.snp.makeConstraints {
            $0.top.equalTo(chatRoomNameLabel.snp.bottom).offset(1)
            $0.leading.equalTo(chatRoomImageView.snp.trailing).offset(11)
        }
        
        chatMessageTime.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(16)
        }
    }
}
