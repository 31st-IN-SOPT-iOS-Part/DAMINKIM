//
//  FriendListView.swift
//  Assignment2
//
//  Created by 김담인 on 2022/10/13.
//

import UIKit
import SnapKit
import Then

final class FriendListView: BaseView {
    
    // MARK: - Properties
    private let headerView = UIView()
    
    private let headerLabel = UILabel().then {
        $0.text = "친구"
        $0.font = UIFont(name: "AppleSDGothicNeo-Semibold", size: 22)
        $0.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    private let headerButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named:"settingImage"), for: .normal)
        $0.imageView?.contentMode = .scaleAspectFill
    }
    
    private let underLineView = UIView().then {
        $0.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
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
    
    lazy var friendTableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.separatorStyle = .singleLine
        $0.separatorColor = .black.withAlphaComponent(0.1)
    }
    
    // MARK: - Function
    override func setupView() {
        self.addSubviews([headerView, myProfileImageButton, myProfileName, myProfileStatusMessage, underLineView, friendTableView])
        headerView.addSubviews([headerLabel, headerButton])
    }
    
    override func setupLayout() {
        headerView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide).offset(14)
            $0.height.equalTo(52)
        }
        
        headerLabel.snp.makeConstraints {
            $0.leading.centerY.equalToSuperview()
        }
        
        headerButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-40)
            $0.centerY.equalToSuperview()
        }
        
        myProfileImageButton.snp.makeConstraints {
            $0.leading.equalTo(safeAreaLayoutGuide).offset(14)
            $0.top.equalTo(headerView.snp.bottom).offset(20)
            $0.width.height.equalTo(60)
        }
        
        myProfileName.snp.makeConstraints {
            $0.leading.equalTo(myProfileImageButton.snp.trailing).offset(11)
            $0.top.equalTo(headerView.snp.bottom).offset(30)
        }
        
        myProfileStatusMessage.snp.makeConstraints {
            $0.leading.equalTo(myProfileImageButton.snp.trailing).offset(11)
            $0.top.equalTo(myProfileName.snp.bottom).offset(10)
        }
        
        underLineView.snp.makeConstraints {
            $0.top.equalTo(myProfileImageButton.snp.bottom).offset(10)
            $0.leading.equalTo(safeAreaLayoutGuide).offset(20)
            $0.trailing.equalTo(safeAreaLayoutGuide).offset(-20)
            $0.height.equalTo(1)
        }
        
        friendTableView.snp.makeConstraints {
            $0.top.equalTo(underLineView.snp.bottom).offset(5)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(70 * ProfileModel.friendList.count)
        }
        
    }
}


