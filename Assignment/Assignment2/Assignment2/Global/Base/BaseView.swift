//
//  BaseView.swift
//  Assignment2
//
//  Created by 김담인 on 2022/10/12.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView() {}
    func setupLayout() {}
}
