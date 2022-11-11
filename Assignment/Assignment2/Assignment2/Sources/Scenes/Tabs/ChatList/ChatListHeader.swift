//
//  ChatListHeader.swift
//  Assignment2
//
//  Created by 김담인 on 2022/11/11.
//

import UIKit
import SnapKit
import Then

final class ChatListHeader: UICollectionReusableView {
    
    // MARK: - Properties
    static let identifier = "ChatListTableViewCell"
    
    private let chatBannerButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "chatTabBannerImage"), for: .normal)
        $0.contentMode = .scaleAspectFit
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
}

extension ChatListHeader {
    private func setLayout() {
        self.addSubView(chatBannerButton)
        
        chatBannerButton.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
