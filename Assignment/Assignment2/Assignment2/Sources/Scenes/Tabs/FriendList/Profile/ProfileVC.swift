//
//  ProfileVC.swift
//  Assignment2
//
//  Created by 김담인 on 2022/10/14.
//

import UIKit

final class ProfileVC: UIViewController {
    
    // MARK: - Properties
    private let profileView = ProfileView()
    
    // MARK: - View Life Cycle
    override func loadView() {
        self.view = profileView
        profileView.backgroundColor = #colorLiteral(red: 0.5254901961, green: 0.568627451, blue: 0.5960784314, alpha: 1)
        var config = UIButton.Configuration.plain()
        config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        profileView.profileImageButton = UIButton().setButtonConfig(config)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAddTarget()
    }
    
    // MARK: - Function
    private func setAddTarget() {
        profileView.closeModalButton.addTarget(self, action: #selector(closeProfileView), for: .touchUpInside)
    }
    
    @objc private func closeProfileView() {
        self.dismiss(animated: true)
    }
}
