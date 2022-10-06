//
//  FirstViewController.swift
//  1st_iOS_Assignment
//
//  Created by 김담인 on 2022/10/06.
//

import UIKit

class FirstViewController: UIViewController {

    private let questionLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 80, y: 200, width: 250, height: 30))
        label.text = "민초 vs 반민초 당신의 선택은?"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let answerTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 80, y: 280, width: 250, height: 40))
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemGray6
        textField.font = .systemFont(ofSize: 18, weight: .medium)
        return textField
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 80, y: 350, width: 250, height: 42))
        button.setTitle("다음으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(touchupNextButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let components: [Any] = [questionLabel, answerTextField, nextButton]
        components.forEach {
            view.addSubview($0 as! UIView)
        }
    }
    
    private func presentToSecondVC() {
        let secondVC = SecondViewController()
        secondVC.modalPresentationStyle = .formSheet
        
//        secondVC.result = answerTextField.text
//        secondVC.dataBind()
        
        if let answer = answerTextField.text {
            secondVC.dataBind(result: answer)
        }
        
        self.present(secondVC, animated: true, completion: nil)
    }
    
    private func pushToSecondVC() {
        let secondVC = SecondViewController()
        
//        secondVC.result = answerTextField.text
//        secondVC.dataBind()
        
        if let answer = answerTextField.text {
            secondVC.dataBind(result: answer)
        }
        
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @objc
    private func touchupNextButton() {
//      presentToSecondVC()
        pushToSecondVC()
    }
}
