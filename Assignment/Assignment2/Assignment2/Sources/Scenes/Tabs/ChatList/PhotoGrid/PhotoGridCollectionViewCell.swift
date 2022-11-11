//
//  PhotoGridCollectionViewCell.swift
//  Assignment2
//
//  Created by 김담인 on 2022/11/04.
//

import UIKit
import SnapKit
import Then

final class PhotoGridCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties
    static let identifier = "PhotoGridCollectionViewCell"
    
    private let photoImageView = UIImageView()
    
    private func setupLayout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        contentView.addSubview(photoImageView)
        
        photoImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func dataBind(model: PhotoGridModel) {
        photoImageView.image = UIImage(named: model.photoName)
    }
}
