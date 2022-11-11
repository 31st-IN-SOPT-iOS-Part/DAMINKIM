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
    
    lazy var friendTableView = UITableView(frame: .zero, style: .grouped).then {
        $0.backgroundColor = .clear
        $0.separatorStyle = .singleLine
        $0.separatorColor = .black.withAlphaComponent(0.1)
    }
    
    // MARK: - Function
    override func setupView() {
        self.addSubviews([headerView, friendTableView])
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
        
        friendTableView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(70 * ProfileModel.friendList.count)
        }
        
    }
}


