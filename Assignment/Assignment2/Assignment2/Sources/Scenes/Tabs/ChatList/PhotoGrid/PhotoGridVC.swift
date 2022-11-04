//
//  PhotoGridVC.swift
//  Assignment2
//
//  Created by 김담인 on 2022/11/04.
//

import UIKit

final class PhotoGridVC: BaseVC {
    
    // MARK: - Properties
    private let photoGridView = PhotoGridView()
    
    // MARK: - View Life Cycle
    override func loadView() {
        self.view = photoGridView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
    }
    
    private func register() {
        photoGridView.photoGridCollectionView.delegate = self
        photoGridView.photoGridCollectionView.dataSource = self
        
        photoGridView.photoGridCollectionView.register(PhotoGridCollectionViewCell.self, forCellWithReuseIdentifier: PhotoGridCollectionViewCell.identifier)
    }
}
extension PhotoGridVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PhotoGridModel.photoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let photoCell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoGridCollectionViewCell.identifier, for: indexPath) as? PhotoGridCollectionViewCell else {return UICollectionViewCell()}
        photoCell.dataBind(model: PhotoGridModel.photoList[indexPath.item])
        return photoCell
    }
}

extension PhotoGridVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let doubleCellWidth = screenWidth - photoGridView.kPhotoInset.left - photoGridView.kPhotoInset.right - photoGridView.kPhotoInterItemSpacing
        return CGSize(width: doubleCellWidth / 2, height: 198)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return photoGridView.kPhotoLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return photoGridView.kPhotoInterItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return photoGridView.kPhotoInset
    }
}
