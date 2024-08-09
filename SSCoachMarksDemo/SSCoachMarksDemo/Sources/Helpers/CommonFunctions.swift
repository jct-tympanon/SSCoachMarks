//
//  CommonFunctions.swift
//  CoachworkDemo
//
//  Created by Yagnik Bavishi on 22/07/24.
//

import SwiftUI

/// Schedules an action to be executed after a specified delay.
///
/// This function takes a time interval and a closure as parameters. The closure (`updateAction`) is executed after the specified delay, allowing for deferred updates or actions to be performed. The action is dispatched on the main queue, ensuring that any UI updates occur on the main thread.
///
/// - Parameters:
///   - delay: The time interval after which the `updateAction` should be executed, specified in seconds.
///   - updateAction: The closure containing the action to be performed after the delay.
func updateAfterDelay(delay: TimeInterval, updateAction: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
        updateAction()
    }
}

/// Returns a `Font` instance based on the specified font family, size, and weight.
///
/// - Parameters:
///   - customFontFamily: The name of the custom font family to use. If `nil` or an empty string, the system font will be used.
///   - fontSize: The size of the font.
///   - fontWeight: The weight of the font.
///   
/// - Returns: A `Font` instance configured with the specified properties. If a custom font family is provided and is not empty, it returns a custom font with the specified family, size, and weight. Otherwise, it returns a system font with the specified size and weight.
func getCustomFont(customFontFamily: String?, fontSize: CGFloat, fontWeight: Font.Weight) -> Font {
    if let fontFamily = customFontFamily, !fontFamily.isEmpty {
        return .custom(fontFamily, fixedSize: fontSize).weight(fontWeight)
    } else {
        return .system(size: fontSize, weight: fontWeight)
    }
}
