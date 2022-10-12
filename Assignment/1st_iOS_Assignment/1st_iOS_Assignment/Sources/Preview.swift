//
//  Preview.swift
//  1st_iOS_Assignment
//
//  Created by 김담인 on 2022/10/07.
//

// MARK: - SwiftUI Preview
#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        LoginViewController().showPreview(.iPhone13mini)
        SignUpViewController().showPreview(.iPhone13mini)
        WelcomeMessageViewController().showPreview(.iPhone13mini)
    }
}
#endif
