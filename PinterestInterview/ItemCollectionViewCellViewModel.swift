//
//  ItemCollectionViewCellViewModel.swift
//  PinterestInterview
//
//  Created by Galileo Guzman on 10/02/23.
//

import UIKit

struct ItemCollectionViewCellViewModel {
    
    // MARK: - Properties
    
    let item: ItemColored

}

extension ItemCollectionViewCellViewModel: ItemPresentable {
    
    // MARK: - Properties
    
    var backgroundColor: UIColor {
        return item.backgroundColor
    }

}
