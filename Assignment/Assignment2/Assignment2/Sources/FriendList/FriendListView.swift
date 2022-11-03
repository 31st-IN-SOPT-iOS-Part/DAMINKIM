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
        $0.text = "라벨"
        $0.font = UIFont(name: "AppleSDGothicNeo-Semibold", size: 22)
        $0.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
   
    private let headerButton = UIButton().then {
        $0.setImage(UIImage(named:"settingImage"), for: .normal)
        $0.imageView?.contentMode = .scaleAspectFill
    }
    
    let profileImageButton = UIButton().then {
        $0.setImage(UIImage(named:ProfileModel.myProfileImageTitle), for: .normal)
        $0.imageView?.contentMode = .scaleAspectFit
    }
   
    // MARK: - Function
    override func setupView() {
        [headerView, profileImageButton].forEach {
            addSubview($0)
        }
        [headerLabel, headerButton].forEach {
            headerView.addSubview($0)
        }
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
                $0.leading.equalTo(headerLabel.snp.trailing).offset(4)
                $0.centerY.equalToSuperview()
            }
        
        profileImageButton.snp.makeConstraints {
            $0.leading.equalTo(safeAreaLayoutGuide).offset(14)
            $0.top.equalTo(headerView.snp.bottom).offset(15)
        }
    }
}
