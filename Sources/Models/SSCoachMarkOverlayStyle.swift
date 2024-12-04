//
//  SSCoachMarkOverlayStyle.swift
//  CoachworkDemo
//
//  Created by Yagnik Bavishi on 08/08/24.
//

import SwiftUI

// MARK: - SSCoachMarkOverlayStyle
/// A style configuration for the overlay used in the CoachMarkView.
/// This struct defines the visual appearance of the overlay, including its color and opacity.
public struct SSCoachMarkOverlayStyle {
    
    // MARK: - Variables
    
    /// The color of the overlay.
    public var overlayColor: Color
    
    /// The opacity of the overlay, where 0.0 is fully transparent and 1.0 is fully opaque.
    public var overlayOpacity: Double
    
    // MARK: - Initializer
    
    /// Initializes a new `SSCoachMarkOverlayStyle` instance with the specified properties.
    ///
    /// - Parameters:
    ///   - overlayColor: The color of the overlay.
    ///   - overlayOpacity: The opacity of the overlay, where 0.0 is fully transparent and 1.0 is fully opaque.
    init(overlayColor: Color, overlayOpacity: Double) {
        self.overlayColor = overlayColor
        self.overlayOpacity = overlayOpacity
    }
}
