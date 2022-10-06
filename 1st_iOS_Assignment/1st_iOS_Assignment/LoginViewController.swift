//
//  LoginViewController.swift
//  1st_iOS_Assignment
//
//  Created by 김담인 on 2022/10/06.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    let headerTitleLable : UILabel = {
        let label = UILabel()
        label.text = "카카오톡을 시작합니다."
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .regular)
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
    }
}

// MARK: - Layout
extension LoginViewController {
    private func setLayout() {
        view.addSubview(headerTitleLable)
        
        headerTitleLable.snp.makeConstraints {
            $0.top.left.right.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(57)
        }
        
        
    }
}
