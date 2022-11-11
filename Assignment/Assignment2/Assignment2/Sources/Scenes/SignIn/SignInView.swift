//
//  SignInView.swift
//  Assignment2
//
//  Created by 김담인 on 2022/10/12.
//

import UIKit
import SnapKit
import Then

final class SignInView: BaseView {
    
    // MARK: - Properties
    let headerTitle = UILabel().then {
        $0.text = "카카오톡을 시작합니다"
        $0.textColor = .black
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 24, weight: .regular)
        $0.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 19)
    }
    
    let headerDiscription = UILabel().then {
        $0.text =
    """
    사용하던 카카오 계정이 있다면
    이메일 또는 전화번호로 로그인해 주세요.
    """
        $0.numberOfLines = 2
        $0.textColor = .systemGray
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 14, weight: .regular)
    }
    
    let idTextField = UITextField().then {
        $0.placeholder = "이메일 또는 전화번호"
        $0.clearButtonMode = .whileEditing
    }
    
    let passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호"
        $0.isSecureTextEntry = true
        $0.clearButtonMode = .whileEditing
    }
    
    let idUnderlineView = UIView().then {
        $0.backgroundColor = .systemGray
    }
    
    let passwordUnderlineView = UIView().then {
        $0.backgroundColor = .systemGray
    }
    
    let loginButton = UIButton().then {
        $0.setTitle("카카오계정 로그인", for: .normal)
        $0.setImage(UIImage(systemName: "Setting"), for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = #colorLiteral(red: 0.9703806043, green: 0.960452497, blue: 0.9649361968, alpha: 1)
    }
    
   let signUpButton = UIButton().then {
        $0.setTitle("새로운 카카오계정 만들기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = #colorLiteral(red: 0.9703806043, green: 0.960452497, blue: 0.9649361968, alpha: 1)
    }
    
    let findAccontInfo = UIButton().then {
        $0.setTitle("카카오계정 또는 비밀번호 찾기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .clear
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 13)
    }
    
    // MARK: - Function
    override func setupView() {
        [headerTitle, headerDiscription, idTextField, idUnderlineView, passwordTextField, passwordUnderlineView, loginButton, signUpButton, findAccontInfo].forEach {
            addSubview($0)
        }
    }
    
    override func setupLayout() {

        // Header
        headerTitle.snp.makeConstraints {
            $0.top.trailing.leading.equalTo(safeAreaLayoutGuide).inset(60)
            $0.height.equalTo(57)
        }
        
        headerDiscription.snp.makeConstraints {
            $0.top.equalTo(headerTitle.snp.bottom).offset(15)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide).inset(20)
        }
        
        // Input Area
        idTextField.snp.makeConstraints {
            $0.top.equalTo(headerDiscription.snp.bottom).offset(60)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide).inset(15)
        }
        
        idUnderlineView.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide).inset(15)
            $0.height.equalTo(1)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idUnderlineView.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide).inset(15)
        }
        
        passwordUnderlineView.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide).inset(10)
            $0.height.equalTo(1)
        }
        
        // Bottom Button
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordUnderlineView.snp.bottom).offset(30)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide).inset(15)
            $0.height.equalTo(40)
        }
        
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide).inset(15)
            $0.height.equalTo(40)
        }
        
        findAccontInfo.snp.makeConstraints {
            $0.top.equalTo(signUpButton.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide)
        }
    }
}


