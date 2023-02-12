//
//  ViewModel.swift
//  PinterestInterview
//
//  Created by Galileo Guzman on 08/02/23.
//

import Foundation

class ViewModel {
    
    var elementsDidChange: (() -> Void)?
    private var elements: [[ItemColored]] = []
    
    init() {
        self.elements = getElements()
    }
    
    private func getElements() -> [[ItemColored]] {
        var items: [[ItemColored]] = []
        for _ in 0...9 {
            var tmpElements: [ItemColored] = []
            for _ in 0...9 {
                tmpElements.append(ItemColored())
            }
            items.append(tmpElements)
        }
        return items
    }
    
    private func item(at indexPath: IndexPath) -> ItemColored {
        return elements[indexPath.section][indexPath.item]
    }
    
    private func turnItem(value: Bool, row: Int, column: Int) {
        elements[row][column].turn(value: value)
    }
    
    // MARK: Public API
    var numberOfRows: Int {
        return elements.count
    }
    
    var numberOfSections: Int {
        10
    }
    
    func presentable(for indexPath: IndexPath) -> ItemPresentable {
        return ItemCollectionViewCellViewModel(item: item(at: indexPath))
    }
    
    func toogleFollowingItemsInColumn(for indexPath: IndexPath) {
        let currentItem = elements[indexPath.section][indexPath.row]
        for i in indexPath.section...elements.count - 1 {
            turnItem(value: !currentItem.isActive, row: i, column: indexPath.row)
        }
        
        elementsDidChange?()
    }
    
    func toogleFollowingItemsInRow(for indexPath: IndexPath) {
        let currentItem = elements[indexPath.section][indexPath.row]
        for i in indexPath.row...elements.count - 1 {
            turnItem(value: !currentItem.isActive, row: indexPath.section, column: i)
        }
        
        elementsDidChange?()
    }
    
    func toogleCurrentRow(for indexPath: IndexPath) {
        let currentItem = elements[indexPath.section][indexPath.row]
        for i in 0...elements.count - 1 {
            turnItem(value: !currentItem.isActive, row: indexPath.section, column: i)
        }
        
        elementsDidChange?()
    }
    
    func toogleCurrentColumn(for indexPath: IndexPath) {
        let currentItem = elements[indexPath.section][indexPath.row]
        for i in 0...elements.count - 1 {
            turnItem(value: !currentItem.isActive, row: i, column: indexPath.row)
        }
        
        elementsDidChange?()
    }
}
