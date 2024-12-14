//
//  Collection+Ext.swift
//  Vocabulary-I
//
//  Created by Jamoliddinov Abduraxmon on 14/12/24.
//

import Foundation

extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
    func element(at index: Index?) -> Element? {
        if let index {
            return self[safe: index]
        } else {
            return nil
        }
    }
}
