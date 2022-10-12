//
//  UIViewController+.swift
//  1st_iOS_Assignment
//
//  Created by 김담인 on 2022/10/07.
//

import UIKit

enum DeviceType {
    case iPhoneSE2
    case iPhone8
    case iPhone13Pro
    case iPhone13mini

    func name() -> String {
        switch self {
        case .iPhoneSE2:
            return "iPhone SE"
        case .iPhone8:
            return "iPhone 8"
        case .iPhone13Pro:
            return "iPhone 13 Pro"
        case .iPhone13mini:
            return "iPhone 13 mini"
        }
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
extension UIViewController {

    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController

        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
    }

    func showPreview(_ deviceType: DeviceType = .iPhone13mini) -> some View {
        Preview(viewController: self).previewDevice(PreviewDevice(rawValue: deviceType.name()))
    }
}
#endif
