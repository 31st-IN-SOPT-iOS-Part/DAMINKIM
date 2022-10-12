//
//  LoginViewController.swift
//  1st_iOS_Assignment
//
//  Created by 김담인 on 2022/10/06.
//

import UIKit
import SnapKit

final class LoginViewController: UIViewController {
    
    // MARK: - Properties
    private let headerTitle: UILabel = {
        let label = UILabel()
        label.text = "카카오톡을 시작합니다"
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .regular)
        return label
    }()
    
    private let headerFirstLabel: UILabel = {
        let label = UILabel()
        label.text = "사용하던 카카오 계정이 있다면"
        label.textColor = .systemGray
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let headerSecondLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일 또는 전화번호로 로그인해 주세요."
        label.textColor = .systemGray
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이메일 또는 전화번호"
        textField.addTarget(self, action: #selector(idEditingDidBegin), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(idEditingDidEnd), for: .editingDidEnd)
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.isSecureTextEntry = true
        textField.addTarget(self, action: #selector(passwordEditingDidBegin), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(passwordEditingDidEnd), for: .editingDidEnd)
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    private let idUnderlineVIew: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray
        return line
    }()
    
    private let passwordUnderlineVIew: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray
        return line
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("카카오계정 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9703806043, green: 0.960452497, blue: 0.9649361968, alpha: 1)
        button.addTarget(self, action: #selector(presentToWelcomeVC), for: .touchUpInside)
        return button
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9703806043, green: 0.960452497, blue: 0.9649361968, alpha: 1)
        button.addTarget(self, action: #selector(pushToSignUpVC), for: .touchUpInside)
        return button
    }()
    
    private let findAccontInfo: UIButton = {
        let button = UIButton()
        button.setTitle("카카오계정 또는 비밀번호 찾기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        return button
    }()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        resetTextField()
    }
    
    // MARK: - Function
    @objc private func pushToSignUpVC() {
        let signUpVC = SignUpViewController()
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    @objc private func presentToWelcomeVC() {
        let welcomeVC = WelcomeMessageViewController()
        welcomeVC.modalPresentationStyle = .fullScreen
        welcomeVC.userID = idTextField.text
        welcomeVC.dataSend()
        self.present(welcomeVC, animated: true, completion: nil)
    }
    
    /// 밑줄 사라지는 애니메이션 적용하려고 넣은건데 분기처리? 해서 줄여야할듯
    @objc private func idEditingDidBegin() {
        UIView.animate(withDuration: 0.1, animations: {
            self.idUnderlineVIew.alpha = 0
        })
    }
    
    @objc private func idEditingDidEnd() {
        UIView.animate(withDuration: 0.1, animations: {
            self.idUnderlineVIew.alpha = 1
        })
    }
    
    @objc private func passwordEditingDidBegin() {
        UIView.animate(withDuration: 0.1, animations: {
            self.passwordUnderlineVIew.alpha = 0
        })
    }
    
    @objc private func passwordEditingDidEnd() {
        UIView.animate(withDuration: 0.2, animations: {
            self.passwordUnderlineVIew.alpha = 1
        })
    }
}

// MARK: - Layout
extension LoginViewController {
    private func resetTextField() {
        idTextField.text = ""
        passwordTextField.text = ""
    }
    private func setLayout() {
        
        let components: [Any] = [headerTitle, headerFirstLabel, headerSecondLabel, idTextField, idUnderlineVIew, passwordTextField, passwordUnderlineVIew, loginButton, signUpButton, findAccontInfo]
        
        components.forEach {
            view.addSubview($0 as! UIView)
        }
        
        // Header
        headerTitle.snp.makeConstraints {
            $0.top.trailing.leading.equalTo(view.safeAreaLayoutGuide).inset(60)
            $0.height.equalTo(57)
        }
        
        headerFirstLabel.snp.makeConstraints {
            $0.top.equalTo(headerTitle.snp.bottom).offset(15)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        headerSecondLabel.snp.makeConstraints {
            $0.top.equalTo(headerFirstLabel.snp.bottom).offset(5)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        // Input Area
        idTextField.snp.makeConstraints {
            $0.top.equalTo(headerSecondLabel.snp.bottom).offset(60)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(15)
        }
        
        idUnderlineVIew.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(15)
            $0.height.equalTo(1)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idUnderlineVIew.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(15)
        }
        
        passwordUnderlineVIew.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(10)
            $0.height.equalTo(1)
        }
        
        // Bottom Button
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordUnderlineVIew.snp.bottom).offset(30)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(15)
            $0.height.equalTo(40)
        }
        
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(15)
            $0.height.equalTo(40)
        }
        
        findAccontInfo.snp.makeConstraints {
            $0.top.equalTo(signUpButton.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
}
