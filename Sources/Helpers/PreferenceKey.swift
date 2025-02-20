//
//  PreferenceKey.swift
//  CoachworkDemo
//
//  Created by Yagnik Bavishi on 07/07/24.
//

import SwiftUI

struct HighlightAnchorKey: PreferenceKey {
    
    // MARK: - Static Variables
    static var defaultValue: [Int: Highlight] = [:]
    
    // MARK: - Static Functions
    static func reduce(value: inout [Int: Highlight], nextValue: () -> [Int: Highlight]) {
        value.merge(nextValue()) { $1 }
    }
}

struct ContentLengthPreference: PreferenceKey {
    
    // MARK: - Static Variables
    static var defaultValue: CGFloat { 0 }
    
    // MARK: - Static Functions
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
