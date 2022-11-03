//
//  WelcomeView.swift
//  Assignment2
//
//  Created by 김담인 on 2022/10/13.
//

import UIKit
import SnapKit
import Then

final class WelcomeView: BaseView {
    
    // MARK: - Properties    
    lazy var welcomeMessage = UILabel().then {
        $0.text = "환영합니다"
        $0.numberOfLines = 0
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        $0.textAlignment = .center
    }
    
    let completionButton = UIButton().then {
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = #colorLiteral(red: 0.9828200936, green: 0.8990030885, blue: 0.2966131866, alpha: 1)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.layer.cornerRadius = 5
    }
    
    // MARK: - Function
    override func setupView() {
        [welcomeMessage, completionButton].forEach {
            addSubview($0)
        }
    }
    
    override func setupLayout() {
        welcomeMessage.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(241)
            $0.right.left.equalTo(safeAreaLayoutGuide)
        }
        
        completionButton.snp.makeConstraints{
            $0.top.equalTo(welcomeMessage.snp.bottom).offset(117)
            $0.right.left.equalTo(safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(40)
        }
    }
}
