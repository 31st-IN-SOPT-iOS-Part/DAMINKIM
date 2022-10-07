//
//  WelcomeMessageViewController.swift
//  1st_iOS_Assignment
//
//  Created by 김담인 on 2022/10/06.
//

import UIKit
import SnapKit


class WelcomeMessageViewController: UIViewController {
    
    // MARK: - Properties
    var userID: String?
    
    private let welcomeUserName: UILabel = {
        let label = UILabel()
        label.text = "유저네임"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    private let welcomeMessage: UILabel = {
        let label = UILabel()
        label.text = "환영합니다"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    private let completionButton: UIButton = {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9828200936, green: 0.8990030885, blue: 0.2966131866, alpha: 1)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(backToRootView), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        dataSend(userName: userID ?? "고객")
        setLayout()
    }

   func dataSend(userName: String) {
       welcomeUserName.text = "\(userName)님"
   }
    
    @objc func backToRootView() {
        guard let presentingVC = self.presentingViewController as? UINavigationController else { return }
        presentingVC.popViewController(animated: false)
        
        self.dismiss(animated: true) {
            presentingVC.popToRootViewController(animated: true)
        }
    }
}

extension WelcomeMessageViewController {
    
    private func setLayout() {
        let components: [Any] = [welcomeUserName, welcomeMessage, completionButton]
        
        components.forEach {
            view.addSubview($0 as! UIView)
        }
        
        welcomeUserName.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(200)
            $0.right.left.equalTo(view.safeAreaLayoutGuide)
        }
        
        welcomeMessage.snp.makeConstraints {
            $0.top.equalTo(welcomeUserName.snp.bottom).offset(10)
            $0.right.left.equalTo(view.safeAreaLayoutGuide)
        }
        
        completionButton.snp.makeConstraints{
            $0.top.equalTo(welcomeMessage.snp.bottom).offset(100)
            $0.right.left.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(40)
        }
        
    }
}
