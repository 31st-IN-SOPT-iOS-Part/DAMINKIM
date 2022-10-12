//
//  SignUpViewController.swift
//  1st_iOS_Assignment
//
//  Created by 김담인 on 2022/10/06.
//

import UIKit
import SnapKit


protocol SignUpViewContollerDelegate {
    func sendId(_ id: String)
}

class SignUpViewController: UIViewController {
    
    var delegate: SignUpViewContollerDelegate?
    
    // MARK: - Properties    
    private let headerTitle : UILabel = {
        let label = UILabel()
        label.text = "카카오톡을 시작합니다"
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .regular)
        return label
    }()
    
    private let idTextField :UITextField = {
        let textField = UITextField()
        textField.placeholder = "이메일 또는 전화번호"
        textField.addTarget(self, action: #selector(idEditingDidBegin), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(idEditingDidEnd), for: .editingDidEnd)
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    private let passwordTextField :UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.isSecureTextEntry = true
        textField.addTarget(self, action: #selector(passwordEditingDidBegin), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(passwordEditingDidEnd), for: .editingDidEnd)
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    private let passwordCheckTextField :UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호 확인"
        textField.isSecureTextEntry = true
        textField.addTarget(self, action: #selector(passwordCheckEditingDidBegin), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(passwordCheckEditingDidEnd), for: .editingDidEnd)
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    private let creatNewAccount: UIButton = {
        let button = UIButton()
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9703806043, green: 0.960452497, blue: 0.9649361968, alpha: 1)
        button.addTarget(self, action: #selector(presentToWelcomeVC), for: .touchUpInside)
        return button
    }()
 
    private let idUnderlineVIew: UIView = {
        let line = UIView()
        line.tintColor = .systemGray
        line.backgroundColor = .systemGray
        return line
    }()
    
    private let passwordUnderlineVIew: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray
        return line
    }()
    
    private let passwordCheckUnderlineVIew: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray
        return line
    }()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
    }
    
    // MARK: - Function
    
    //TODO: editing 분기 처리
    @objc func presentToWelcomeVC() {
        
        let welcomeVC = WelcomeMessageViewController()
        welcomeVC.modalPresentationStyle = .fullScreen
        welcomeVC.userID = idTextField.text
        welcomeVC.dataSend()
        self.delegate = welcomeVC
        self.present(welcomeVC, animated: true, completion: nil)
    }
    
    @objc func idEditingDidBegin() {
        UIView.animate(withDuration: 0.1, animations: {
            self.idUnderlineVIew.alpha = 0
        })
    }
    
    @objc func idEditingDidEnd() {
        UIView.animate(withDuration: 0.1, animations: {
            self.idUnderlineVIew.alpha = 1
        })
    }
    
    @objc func passwordEditingDidBegin() {
        UIView.animate(withDuration: 0.1, animations: {
            self.passwordUnderlineVIew.alpha = 0
        })
    }
    
    @objc func passwordEditingDidEnd() {
        UIView.animate(withDuration: 0.2, animations: {
            self.passwordUnderlineVIew.alpha = 1
        })
    }
    
    @objc func passwordCheckEditingDidBegin() {
        UIView.animate(withDuration: 0.2, animations: {
            self.passwordCheckUnderlineVIew.alpha = 0
        })
    }
    
    @objc func passwordCheckEditingDidEnd() {
        UIView.animate(withDuration: 0.2, animations: {
            self.passwordCheckUnderlineVIew.alpha = 1
        })
    }
}

    // MARK: - Layout
extension SignUpViewController {
    private func setLayout() {
        
       let components: [Any] = [headerTitle, idTextField, idUnderlineVIew, passwordTextField, passwordUnderlineVIew, passwordCheckTextField, passwordCheckUnderlineVIew, creatNewAccount]
        
        components.forEach {
            view.addSubview($0 as! UIView)
        }
        // Header
        headerTitle.snp.makeConstraints {
            $0.top.left.right.equalTo(view.safeAreaLayoutGuide).inset(50)
            $0.height.equalTo(57)
        }
        
        // Input Area
        idTextField.snp.makeConstraints {
            $0.top.equalTo(headerTitle.snp.bottom).offset(80)
            $0.left.right.equalTo(view.safeAreaLayoutGuide).inset(15)
        }
        
        idUnderlineVIew.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(15)
            $0.left.right.equalTo(view.safeAreaLayoutGuide).inset(15)
            $0.height.equalTo(1)
        }
    
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idUnderlineVIew.snp.bottom).offset(20)
            $0.left.right.equalTo(view.safeAreaLayoutGuide).inset(15)
        }
        
        passwordUnderlineVIew.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(15)
            $0.left.right.equalTo(view.safeAreaLayoutGuide).inset(15)
            $0.height.equalTo(1)
        }
        
        passwordCheckTextField.snp.makeConstraints {
            $0.top.equalTo(passwordUnderlineVIew.snp.bottom).offset(20)
            $0.left.right.equalTo(view.safeAreaLayoutGuide).inset(15)
        }
        
        passwordCheckUnderlineVIew.snp.makeConstraints {
            $0.top.equalTo(passwordCheckTextField.snp.bottom).offset(15)
            $0.left.right.equalTo(view.safeAreaLayoutGuide).inset(15)
            $0.height.equalTo(1)
        }
        
        // Bottom Button
        creatNewAccount.snp.makeConstraints {
            $0.top.equalTo(passwordCheckUnderlineVIew.snp.bottom).offset(30)
            $0.left.right.equalTo(view.safeAreaLayoutGuide).inset(15)
            $0.height.equalTo(40)
        }
        
    }
}

