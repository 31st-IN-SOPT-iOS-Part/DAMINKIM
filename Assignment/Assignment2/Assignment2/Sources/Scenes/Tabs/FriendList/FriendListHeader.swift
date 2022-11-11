//
//  FriendListHeader.swift
//  Assignment2
//
//  Created by 김담인 on 2022/11/11.
//

import UIKit
import SnapKit
import Then

final class FriendListHeader: UITableViewHeaderFooterView {
    
    // MARK: - Initialization
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties
    static let identifier: String = "FriendListHeader"
    
    let myProfileImageButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named:"MyProfileImage"), for: .normal)
        $0.imageView?.contentMode = .scaleAspectFit
    }
    
    private let myProfileName = UILabel().then {
        $0.text = "김담인"
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        $0.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    private let myProfileStatusMessage = UILabel().then {
        $0.text = "으ㅏ아아아"
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 11)
        $0.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
}
extension FriendListHeader {
    private func setLayout() {
        self.addSubviews([myProfileImageButton, myProfileName, myProfileStatusMessage])
        
        myProfileImageButton.snp.makeConstraints {
            $0.leading.equalTo(safeAreaLayoutGuide).offset(14)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(60)
        }
        
        myProfileName.snp.makeConstraints {
            $0.leading.equalTo(myProfileImageButton.snp.trailing).offset(11)
            $0.top.equalToSuperview().offset(19)
        }
        
        myProfileStatusMessage.snp.makeConstraints {
            $0.leading.equalTo(myProfileImageButton.snp.trailing).offset(11)
            $0.top.equalTo(myProfileName.snp.bottom).offset(6)
        }
    }
}
