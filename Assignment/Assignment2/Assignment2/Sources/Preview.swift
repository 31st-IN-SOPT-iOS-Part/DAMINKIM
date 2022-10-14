//
//  Preview.swift
//  Assignment2
//
//  Created by 김담인 on 2022/10/13.
//

// MARK: - SwiftUI Preview
#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        FriendListVC().showPreview(.iPhone14Pro)
    }
}
#endif
