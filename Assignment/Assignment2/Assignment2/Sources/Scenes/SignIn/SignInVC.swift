//
//  SignInVC.swift
//  Assignment2
//
//  Created by 김담인 on 2022/10/12.
//

import UIKit

final class SignInVC: BaseVC{
    
    // MARK: - Properties
    private let signInView = SignInView()
    
    override func loadView() {
        self.view = signInView
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setAddTarget()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        resetTextField()
    }
    
    // MARK: - Function
    private func setAddTarget() {
        signInView.loginButton.addTarget(self, action: #selector(presentToWelcomeVC), for: .touchUpInside)
        signInView.signUpButton.addTarget(self, action: #selector(pushToSignUpVC), for: .touchUpInside)
    }
    
    @objc private func pushToSignUpVC() {
        let signUpVC = SignUpVC()
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    @objc private func presentToWelcomeVC() {
        let welcomeVC = WelcomeVC()
        welcomeVC.userID = signInView.idTextField.text
        welcomeVC.setUserID()
        welcomeVC.modalPresentationStyle = .fullScreen
        self.present(welcomeVC, animated: true, completion: nil)
    }
}

// MARK: - Layout
extension SignInVC {
    private func resetTextField() {
        signInView.idTextField.text = ""
        signInView.passwordTextField.text = ""
    }
}
