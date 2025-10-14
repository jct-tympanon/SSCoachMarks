//
//  CommonModifier.swift
//  CoachworkDemo
//
//  Created by Yagnik Bavishi on 22/07/24.
//

import SwiftUI

@available(macOS 12.0, *)
struct FilledButtonTextModifier: ViewModifier {
    
    // MARK: - Variables
    var foregroundStyle: Color
    var font: Font
    
    func body(content: Content) -> some View {
        content
            .font(font)
            .padding(.vertical, 15)
            .padding(.horizontal, 25)
            .foregroundStyle(foregroundStyle)
    }
}

struct UnFilledButtonTextModifier: ViewModifier {
    
    // MARK: - Variables
    var foregroundStyle: Color
    var font: Font
    
    func body(content: Content) -> some View {
        content
            .font(font)
            .padding(.vertical, 15)
            .padding(.horizontal, 25)
            .foregroundColor(foregroundStyle)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.clear, lineWidth: 2)
            )
    }
}
