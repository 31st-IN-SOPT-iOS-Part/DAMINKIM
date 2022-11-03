//
//  SignUpVC.swift
//  Assignment2
//
//  Created by 김담인 on 2022/10/12.
//

import UIKit

final class SignUpVC: BaseVC {
    
    // MARK: - Properties
    private let signUpView = SignUpView()
    
    // MARK: - View Life Cycle
    override func loadView() {
        self.view = signUpView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAddTarget()
    }
    
    // MARK: - Function
    private func setAddTarget() {
        signUpView.creatNewAccount.addTarget(self, action: #selector(presentToWelcomeVC), for: .touchUpInside)
        
        signUpView.idTextField.addTarget(self, action: #selector(idEditingDidBegin), for: .editingDidBegin)
        signUpView.passwordTextField.addTarget(self, action: #selector(passwordEditingDidBegin), for: .editingDidBegin)
        signUpView.passwordCheckTextField.addTarget(self, action: #selector(passwordCheckEditingDidBegin), for: .editingDidBegin)
        signUpView.idTextField.addTarget(self, action: #selector(idEditingDidEnd), for: .editingDidEnd)
        signUpView.passwordTextField.addTarget(self, action: #selector(passwordEditingDidEnd), for: .editingDidEnd)
        signUpView.passwordCheckTextField.addTarget(self, action: #selector(passwordCheckEditingDidEnd), for: .editingDidEnd)
    }
    //TODO: UITextField Delegate 사용해 수정
    @objc func presentToWelcomeVC() {
        let welcomeVC = WelcomeVC()
        welcomeVC.modalPresentationStyle = .fullScreen
        welcomeVC.userID = signUpView.idTextField.text
        welcomeVC.setUserID()
        self.present(welcomeVC, animated: true, completion: nil)
    }
    
    @objc func idEditingDidBegin() {
        UIView.animate(withDuration: 0.1, animations: {
            self.signUpView.idUnderlineVIew.alpha = 0
        })
    }
    
    @objc func idEditingDidEnd() {
        UIView.animate(withDuration: 0.1, animations: {
            self.signUpView.idUnderlineVIew.alpha = 1
        })
    }
    
    @objc func passwordEditingDidBegin() {
        UIView.animate(withDuration: 0.1, animations: {
            self.signUpView.passwordUnderlineVIew.alpha = 0
        })
    }
    
    @objc func passwordEditingDidEnd() {
        UIView.animate(withDuration: 0.2, animations: {
            self.signUpView.passwordUnderlineVIew.alpha = 1
        })
    }
    
    @objc func passwordCheckEditingDidBegin() {
        UIView.animate(withDuration: 0.2, animations: {
            self.signUpView.passwordCheckUnderlineVIew.alpha = 0
        })
    }
    
    @objc func passwordCheckEditingDidEnd() {
        UIView.animate(withDuration: 0.2, animations: {
            self.signUpView.passwordCheckUnderlineVIew.alpha = 1
        })
    }
}
