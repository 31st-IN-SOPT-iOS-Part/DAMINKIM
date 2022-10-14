//
//  SingUpView.swift
//  Assignment2
//
//  Created by 김담인 on 2022/10/13.
//

import UIKit
import SnapKit
import Then

final class SignUpView: BaseView {
    
    // MARK: - Properties
    private let headerTitle = UILabel().then {
        $0.text = "카카오톡을 시작합니다"
        $0.textColor = .black
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 24, weight: .regular)
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
    
    let passwordCheckTextField = UITextField().then {
        $0.placeholder = "비밀번호 확인"
        $0.isSecureTextEntry = true
        $0.clearButtonMode = .whileEditing
    }
    
    let creatNewAccount = UIButton().then {
        $0.setTitle("새로운 카카오계정 만들기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = #colorLiteral(red: 0.9703806043, green: 0.960452497, blue: 0.9649361968, alpha: 1)
    }
 
    let idUnderlineVIew = UIView().then {
        $0.tintColor = .systemGray
        $0.backgroundColor = .systemGray
    }
    
    let passwordUnderlineVIew = UIView().then {
        $0.backgroundColor = .systemGray
    }
    
    let passwordCheckUnderlineVIew = UIView().then {
        $0.backgroundColor = .systemGray
    }
    
    override func setupView() {
        [headerTitle, idTextField, idUnderlineVIew, passwordTextField, passwordUnderlineVIew, passwordCheckTextField, passwordCheckUnderlineVIew, creatNewAccount].forEach {
            addSubview($0)
         }
    }
    
    override func setupLayout() {
       
         // Header
         headerTitle.snp.makeConstraints {
             $0.top.left.right.equalTo(safeAreaLayoutGuide).inset(50)
             $0.height.equalTo(57)
         }
         
         // Input Area
         idTextField.snp.makeConstraints {
             $0.top.equalTo(headerTitle.snp.bottom).offset(80)
             $0.left.right.equalTo(safeAreaLayoutGuide).inset(15)
         }
         
         idUnderlineVIew.snp.makeConstraints {
             $0.top.equalTo(idTextField.snp.bottom).offset(15)
             $0.left.right.equalTo(safeAreaLayoutGuide).inset(15)
             $0.height.equalTo(1)
         }
     
         passwordTextField.snp.makeConstraints {
             $0.top.equalTo(idUnderlineVIew.snp.bottom).offset(20)
             $0.left.right.equalTo(safeAreaLayoutGuide).inset(15)
         }
         
         passwordUnderlineVIew.snp.makeConstraints {
             $0.top.equalTo(passwordTextField.snp.bottom).offset(15)
             $0.left.right.equalTo(safeAreaLayoutGuide).inset(15)
             $0.height.equalTo(1)
         }
         
         passwordCheckTextField.snp.makeConstraints {
             $0.top.equalTo(passwordUnderlineVIew.snp.bottom).offset(20)
             $0.left.right.equalTo(safeAreaLayoutGuide).inset(15)
         }
         
         passwordCheckUnderlineVIew.snp.makeConstraints {
             $0.top.equalTo(passwordCheckTextField.snp.bottom).offset(15)
             $0.left.right.equalTo(safeAreaLayoutGuide).inset(15)
             $0.height.equalTo(1)
         }
         
         // Bottom Button
         creatNewAccount.snp.makeConstraints {
             $0.top.equalTo(passwordCheckUnderlineVIew.snp.bottom).offset(30)
             $0.left.right.equalTo(safeAreaLayoutGuide).inset(15)
             $0.height.equalTo(40)
         }
         
     }
}
