//
//  FriendTableViewCell.swift
//  Assignment2
//
//  Created by 김담인 on 2022/11/04.
//

import UIKit
import SnapKit
import Then

final class FriendTableViewCell: UITableViewCell {
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        satupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties
    
    static let identifier = "FriendTableViewCell"
    
    private let profileContainerView = UIView()
    private let profileImageView = UIImageView()
    private let profileNameLabel = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
    }
    
    private let profileStatusMessageLabel = UILabel().then {
        $0.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 11)
    }
    
    // MARK: - Function
    
    func dataBind(model: ProfileModel) {
        profileImageView.image = UIImage(named: model.profileImageTitle)
        profileNameLabel.text = model.profileName
        profileStatusMessageLabel.text = model.profileStatusMessage
    }
    
    private func satupLayout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        self.addSubviews([profileContainerView, profileNameLabel, profileStatusMessageLabel])
        
        profileContainerView.addSubview(profileImageView)
        
        profileContainerView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.width.height.equalTo(44)
        }
        
        profileImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        profileNameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileContainerView.snp.trailing).offset(11)
            $0.top.equalToSuperview().offset(10)
        }
        
        profileStatusMessageLabel.snp.makeConstraints {
            $0.leading.equalTo(profileContainerView.snp.trailing).offset(11)
            $0.top.equalTo(profileNameLabel.snp.bottom).offset(1)
        }
    }
}
