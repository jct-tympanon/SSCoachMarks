//
//  SSCoachMarkConfiguration.swift
//  CoachworkDemo
//
//  Created by Yagnik Bavishi on 04/08/24.
//

import SwiftUI

// MARK: - SSCoachMarkConfiguration
/// A configuration structure for customising the appearance and behaviour of the CoachMarkView.
/// This struct allows you to define the styles for text, buttons, and the overlay in the CoachMark.
@available(macOS 15.0, *)
public struct SSCoachMarkConfiguration {
    
    // MARK: - Text, Colors and fonts
    
    /// The title text is styled with a black color, a font size of 18, and a semibold font weight.
    public var coachMarkTitleViewStyle: SSCoachMarkTextStyle = .init(foregroundStyle: .black,
                                                                     fontSize: Constants.coachMarkTitleDefaultFontSize,
                                                                     fontWeight: .semibold)
    
    /// The description text is styled with a black color, a font size of 17, and a regular font weight.
    public var coachMarkDescriptionViewStyle: SSCoachMarkTextStyle = .init(foregroundStyle: .black,
                                                                           fontSize: Constants.coachMarkDescriptionDefaultFontSize,
                                                                           fontWeight: .regular)
    
    /// The overlay is styled with a black color and an opacity of 0.7.
    public var overlayStyle: SSCoachMarkOverlayStyle = .init(overlayColor: .black, 
                                                             overlayOpacity: Constants.overlayStyleDefaultValue)
    
    /// The button is styled with white text, a black background, a font size of 12, and a regular font weight.
    public var nextButtonStyle: SSCoachMarkButtonStyle = .init(buttonText: Constants.nextButtonDefaultText,
                                                               foregroundStyle: .white,
                                                               backgroundColor: Color.defaultColor,
                                                               fontSize: Constants.buttonsDefaultFontSize,
                                                               fontWeight: .regular)
    
    /// The button is styled with white text, a black background, a font size of 12, and a regular font weight.
    public var backButtonStyle: SSCoachMarkButtonStyle = .init(buttonText: Constants.backButtonDefaultText,
                                                               foregroundStyle: .white,
                                                               backgroundColor: Color.defaultColor,
                                                               fontSize: Constants.buttonsDefaultFontSize,
                                                               fontWeight: .regular)
    
    /// The button is styled with white text, a black background, a font size of 12, and a regular font weight.
    public var doneButtonStyle: SSCoachMarkButtonStyle = .init(buttonText: Constants.doneButtonDefaultText,
                                                               foregroundStyle: .white,
                                                               backgroundColor: Color.defaultColor,
                                                               fontSize: Constants.buttonsDefaultFontSize,
                                                               fontWeight: .regular)
    
    /// The button is styled with black text, a black background, a font size of 12, and a regular font weight.
    public var skipCoachMarkButtonStyle: SSCoachMarkButtonStyle = .init(buttonText: Constants.skipCoachMarkButtonDefaultText,
                                                                        foregroundStyle: .white,
                                                                        backgroundColor: Color.defaultColor,
                                                                        fontSize: Constants.buttonsDefaultFontSize,
                                                                        fontWeight: .regular)
    
}
