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
    lazy var photoGridCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    // MARK: - constants
    final let kPhotoInset: UIEdgeInsets = UIEdgeInsets(top: 49, left: 20, bottom: 10, right: 20)
    final let kPhotoLineSpacing: CGFloat = 10
    final let kPhotoInterItemSpacing: CGFloat = 21
    final let kCellHeight: CGFloat = 198
    
    
    override func setupLayout() {
        self.backgroundColor = .white
        self.addSubview(photoGridCollectionView)
        photoGridCollectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(calculateCellHeight())
        }
    }
    
    private func calculateCellHeight() -> CGFloat {
        let count = CGFloat(PhotoGridModel.photoList.count)
        let heightCount = count / 2 + count.truncatingRemainder(dividingBy: 2)
        return heightCount * kCellHeight + (heightCount - 1) * kPhotoLineSpacing + kPhotoInset.top + kPhotoInset.bottom
    }
    
}
