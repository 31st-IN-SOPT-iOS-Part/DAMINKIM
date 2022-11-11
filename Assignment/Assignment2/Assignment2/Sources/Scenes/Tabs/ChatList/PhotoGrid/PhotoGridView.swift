//
//  PhotoGridView.swift
//  Assignment2
//
//  Created by 김담인 on 2022/11/04.
//

import UIKit
import SnapKit
import Then

final class PhotoGridView: BaseView {
    
    // MARK: - Properties
    private let headerView = UIView()
    
    private let headerTitle = UILabel().then {
        $0.text = "최근항목"
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        $0.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    let closeModalButton = UIButton().then {
        $0.setBackgroundImage(UIImage(systemName: "xmark"), for: .normal)
        $0.tintColor = .black
        $0.contentMode = .scaleAspectFit
    }
    
    private let sendPhotoButton = UIButton().then {
        $0.setTitle("전송", for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        $0.setTitleColor(.black, for: .normal)
    }
    
    let layout = UICollectionViewFlowLayout().then{
        $0.scrollDirection = .vertical
    }
    
    lazy var photoGridCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = true
        $0.showsVerticalScrollIndicator = false
    }
    
    // MARK: - constants
    final let kPhotoInset: UIEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
    final let kPhotoLineSpacing: CGFloat = 9
    final let kPhotoInterItemSpacing: CGFloat = 7
    final let kCellHeight: CGFloat = 123
    
    
    override func setupLayout() {
        self.addSubviews([headerView, photoGridCollectionView])
        headerView.addSubviews([headerTitle, closeModalButton, sendPhotoButton])
        
        headerView.snp.makeConstraints {
            $0.leading.top.equalTo(safeAreaLayoutGuide)
            $0.trailing.equalTo(safeAreaLayoutGuide).offset(-10)
            $0.height.equalTo(50)
        }
        
        photoGridCollectionView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(calculateCellHeight())
        }
        
        /// headerView 내 레이아웃
        headerTitle.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        closeModalButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(12)
            $0.height.width.equalTo(20)
        }
        
        sendPhotoButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-11)
        }
    }
    
    private func calculateCellHeight() -> CGFloat {
        let count = CGFloat(PhotoGridModel.photoList.count)
        let heightCount = count / 3 + count.truncatingRemainder(dividingBy: 3)
        return heightCount * kCellHeight + (heightCount - 1) * kPhotoLineSpacing + kPhotoInset.top + kPhotoInset.bottom
    }
    
}

