//
//  SSCoachMarkButtonStyle.swift
//  CoachworkDemo
//
//  Created by Yagnik Bavishi on 08/08/24.
//

import SwiftUI

// MARK: - SSCoachMarkButtonStyle
/// A style configuration for a button used in the CoachMarkView.
/// This struct defines various visual aspects of the button, such as text, colors, and font attributes.
public struct SSCoachMarkButtonStyle {
    
    // MARK: - Variables
    
    /// The text to be displayed on the button.
    public var buttonText: String
    
    /// The color of the button text.
    public var foregroundStyle: Color
    
    /// The background color of the button.
    public var backgroundColor: Color
    
    /// The size of the button text font.
    public var fontSize: CGFloat
    
    /// The name of the font family for the button text. Default is nil.
    public var fontFamily: String?
    
    /// The weight of the button text font.
    public var fontWeight: Font.Weight
    
    // MARK: - Initializer
    
    /// Initializes a new `SSCoachMarkButtonStyle` instance with the specified properties.
    ///
    /// - Parameters:
    ///   - buttonText: The text to be displayed on the button.
    ///   - foregroundStyle: The color of the button text.
    ///   - backgroundColor: The background color of the button.
    ///   - fontSize: The size of the button text font.
    ///   - fontFamily: The name of the font family for the button text. Default is nil.
    ///   - fontWeight: The weight of the button text font.
    init(buttonText: String,
         foregroundStyle: Color,
         backgroundColor: Color,
         fontSize: CGFloat,
         fontFamily: String? = "",
         fontWeight: Font.Weight) {
        self.buttonText = buttonText
        self.foregroundStyle = foregroundStyle
        self.backgroundColor = backgroundColor
        self.fontSize = fontSize
        self.fontFamily = fontFamily
        self.fontWeight = fontWeight
    }
}
