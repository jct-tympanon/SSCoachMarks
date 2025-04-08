//
//  CoachMarkModel.swift
//  CoachworkDemo
//
//  Created by Yagnik Bavishi on 07/07/24.
//

import SwiftUI

// MARK: Highlight Model
/// This model contains the information related to coach mark view
public struct Highlight: Identifiable, Equatable {
    
    // MARK: - Variables
    
    /// Unique identifier for each highlight instance.
    public var id: UUID = UUID()
    
    /// The anchor point used to position the highlight on the screen.
    public var anchor: Anchor<CGRect>
    
    /// Optional title displayed on the highlight.
    public var title: String?
    
    /// Optional detailed description displayed on the coach mark view.
    public var description: String?
    
    /// The corner radius applied to the coach mark view background.
    public var highlightViewCornerRadius: CGFloat
    
    /// The scaleEffect applied to the coach mark view, which can be used for show coach mark view with scaleEffect
    public var scaleEffect: CGFloat
    
    /// The background color of the coach mark, which is the visual cue to the user.
    public var coachMarkBackGroundColor: Color
    
    /// Optional custom view that can replace the default coach mark appearance.
    public var customCoachMarkView: AnyView?
    
    // MARK: - Static functions
    
    /// Equatable conformance: two highlights are considered equal if they have the same ID.
    public static func == (lhs: Highlight, rhs: Highlight) -> Bool {
        return lhs.id == rhs.id
    }
}
