//
//  ItemColored.swift
//  PinterestInterview
//
//  Created by Galileo Guzman on 08/02/23.
//

import UIKit

struct ItemColored {
    var isActive: Bool
    
    init() {
        self.isActive = Bool.random()
    }
    
    mutating func turn(value: Bool) {
        isActive = value
    }
    
    var backgroundColor: UIColor {
        isActive ? .white : .black
    }
    
}
