//
//  ProfileView.swift
//  Assignment2
//
//  Created by 김담인 on 2022/10/14.
//

import UIKit
import SnapKit
import Then

final class ProfileView: BaseView {
    
    // MARK: - Properties
    let closeModalButton = UIButton().then {
        $0.setImage(UIImage(systemName: "xmark"), for: .normal)
        $0.imageView?.contentMode = .scaleAspectFit
        $0.tintColor = .white
    }
    
    lazy var profileImageButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "MyProfileImage"), for: .normal)
        $0.contentMode = .scaleAspectFit
    }
    
    private let profileName = UILabel().then {
        $0.text = "김솝트"
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 18)
        $0.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private let profileLine = UIView().then {
        $0.backgroundColor = .white
    }
    
    private let profileButtonStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
    }
    
    private let chatWithMeButton = UIButton().then {
        $0.setImage(UIImage(named: "profileTalkImg"), for: .normal)
        $0.contentMode = .scaleAspectFit
    }
    
    private let editProfileButton = UIButton().then {
        $0.setImage(UIImage(named: "profileEditImg"), for: .normal)
        $0.contentMode = .scaleAspectFit
    }
    
    private let storyButton = UIButton().then {
        $0.setImage(UIImage(named: "profileStoryImg"), for: .normal)
        $0.contentMode = .scaleAspectFit
    }
    
    // MARK: - Function
    override func setupView() {
        [closeModalButton, profileImageButton, profileName, profileLine, profileButtonStackView].forEach {
            addSubview($0)
        }
        
        [chatWithMeButton, editProfileButton, storyButton].forEach {
            profileButtonStackView.addArrangedSubview($0)
        }
    }
    
    override func setupLayout() {
        closeModalButton.snp.makeConstraints {
            $0.leading.equalTo(safeAreaLayoutGuide).offset(18)
            $0.top.equalTo(safeAreaLayoutGuide).offset(14)
        }
        
        profileImageButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(202)
            $0.width.height.equalTo(97)
        }
        
        profileName.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(profileImageButton.snp.bottom).offset(8)
        }
        
        profileLine.snp.makeConstraints {
            $0.top.equalTo(profileName.snp.bottom).offset(42)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide)
            $0.height.equalTo(1)
        }
        
        profileButtonStackView.snp.makeConstraints {
            $0.top.equalTo(profileLine.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(48)
            $0.trailing.equalToSuperview().inset(48)
            $0.height.equalTo(72)
        }
    }
    
}
