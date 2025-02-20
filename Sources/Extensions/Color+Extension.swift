//
//  Color+Extension.swift
//  CoachworkDemo
//
//  Created by Yagnik Bavishi on 08/08/24.
//

import SwiftUI

extension Color {
    
    /// Initializes a `Color` instance using a hexadecimal color code and an optional opacity value.
    ///
    /// This initializer allows you to create a `Color` from a hex code, which is a common way to represent colors in design.
    /// The hex code should be provided as a `UInt`, and you can optionally specify the alpha (opacity) value.
    ///
    /// - Parameters:
    ///   - hex: The hexadecimal color code as an unsigned integer. For example, `0xEF5366` represents a pinkish-red color.
    ///   - alpha: The opacity of the color, ranging from 0.0 (completely transparent) to 1.0 (completely opaque). The default value is 1.0.
    ///
    /// - Note: The hex code should include the red, green, and blue components in the format `0xRRGGBB`.
    ///         The alpha value is specified separately as the `alpha` parameter.
    ///
    /// - Example:
    ///   ```swift
    ///   let customColor = Color(hex: 0xEF5366)
    ///   let semiTransparentColor = Color(hex: 0xEF5366, alpha: 0.5)
    ///   ```
    init(hex: UInt, alpha: Double = 1) {
        self.init(.sRGB,
                  red: Double((hex >> 16) & 0xff) / 255,
                  green: Double((hex >> 08) & 0xff) / 255,
                  blue: Double((hex >> 00) & 0xff) / 255,
                  opacity: alpha)
    }
    
}

extension Color {
    
    /// A static property that represents the default color used throughout the application.
    ///
    /// This `defaultColor` is defined as a `Color` instance created from the hex code `0xEF5366`,
    /// which is a pinkish-red hue. You can use this color consistently across your app to maintain a cohesive design language.
    ///
    /// - Example:
    ///   ```swift
    ///   let buttonColor = Color.defaultColor
    ///   Text("Hello, World!")
    ///       .foregroundColor(.defaultColor)
    ///   ```
    static let defaultColor = Color(hex: 0xEF5366)
    
}
