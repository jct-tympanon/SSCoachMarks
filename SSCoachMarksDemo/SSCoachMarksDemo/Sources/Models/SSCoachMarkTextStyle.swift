//
//  SSCoachMarkTextStyle.swift
//  CoachworkDemo
//
//  Created by Yagnik Bavishi on 08/08/24.
//

import SwiftUI

// MARK: - SSCoachMarkTextStyle
/// A style configuration for text used in the CoachMarkView.
/// This struct defines various visual attributes for text, such as color, font size, and font style.
public struct SSCoachMarkTextStyle {
    
    // MARK: - Variables
    
    /// The color of the text.
    public var foregroundStyle: Color
    
    /// The size of the text font.
    public var fontSize: CGFloat
    
    /// The name of the font family for the text. Default is nil.
    public var fontFamily: String?
    
    /// The weight of the text font.
    public var fontWeight: Font.Weight
    
    // MARK: - Initializer
    
    /// Initializes a new `SSCoachMarkTextStyle` instance with the specified properties.
    ///
    /// - Parameters:
    ///   - foregroundStyle: The color of the text.
    ///   - fontSize: The size of the text font.
    ///   - fontFamily: The name of the font family for the text. Default is nil.
    ///   - fontWeight: The weight of the text font.
    init(foregroundStyle: Color,
         fontSize: CGFloat,
         fontFamily: String? = "",
         fontWeight: Font.Weight) {
        self.foregroundStyle = foregroundStyle
        self.fontSize = fontSize
        self.fontFamily = fontFamily
        self.fontWeight = fontWeight
    }
}

