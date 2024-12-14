//
//  Int+Ext.swift
//  Vocabulary-I
//
//  Created by Jamoliddinov Abduraxmon on 13/12/24.
//

import Foundation

extension Int {
    mutating func decrement() {
        if self > 0 {
            self -= 1
        }
    }
    
    mutating func increment() {
        self += 1
    }
}
