//
//  CustomFlowLayout.swift
//  PinterestInterview
//
//  Created by Galileo Guzman on 08/02/23.
//

import UIKit

class CustomFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }
        
        let availableWidth = collectionView.bounds.inset(by: collectionView.layoutMargins).width
        let cellWidth = (availableWidth / CGFloat(10)).rounded(.down)
        
        self.itemSize = CGSize(width: cellWidth, height: cellWidth)
        self.minimumInteritemSpacing = 1.0
        
        self.sectionInset = UIEdgeInsets(top: self.minimumInteritemSpacing, left: 0.0, bottom: 0.0, right: 0.0)
        
        self.sectionInsetReference = .fromSafeArea
    }
}
