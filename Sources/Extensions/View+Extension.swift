//
//  View+Extension.swift
//  CoachworkDemo
//
//  Created by Yagnik Bavishi on 07/07/24.
//

import SwiftUI

extension View {
    
    /// Displays a coach mark on the view, highlighting a specific area based on the provided parameters.
    ///
    /// - Parameters:
    ///   - order: An `Int` representing the order in which the coach mark will appear relative to others.
    ///     This allows you to control the sequence of coach marks.
    ///   - title: An optional `String` for the title of the coach mark. If `nil`, no title will be displayed.
    ///   - description: A `String` providing the descriptive text of the coach mark. This is usually used to explain the highlighted feature.
    ///   - highlightViewCornerRadius: A `CGFloat` value that defines the corner radius of the view being highlighted.
    ///   - scaleEffect: A `CGFloat` value that determines the scaling effect of the highlighted view when the coach mark is shown. The default value is `1.2`.
    ///   - coachMarkBackGroundColor: A `Color` specifying the background color of the coach mark. The default color is white.
    ///
    /// - Returns: A view that contains the anchor preference with the associated `Highlight` object,
    ///            which will be used by the coach mark manager to display the coach mark in the correct sequence and style.
    ///
    /// - Example:
    ///   ```swift
    ///   someView.showCoachMark(order: 1,
    ///                          title: "This is a title",
    ///                          description: "This is the description explaining the feature.",
    ///                          highlightViewCornerRadius: 8)
    ///   ```
    @ViewBuilder
    public func showCoachMark(order: Int,
                              title: String? = nil,
                              description: String,
                              highlightViewCornerRadius: CGFloat,
                              scaleEffect: CGFloat = 1.2,
                              coachMarkBackGroundColor: Color = .white) -> some View {
        self.anchorPreference(key: HighlightAnchorKey.self, value: .bounds) { anchor in
            let highlight = Highlight(anchor: anchor,
                                      title: title,
                                      description: description,
                                      highlightViewCornerRadius: highlightViewCornerRadius,
                                      scaleEffect: scaleEffect,
                                      coachMarkBackGroundColor: coachMarkBackGroundColor,
                                      customCoachMarkView: nil)
            return [order: highlight]
        }
    }
    
    /// Displays a coach mark on the view, highlighting a specific area with the option to provide a custom coach mark view.
    ///
    /// - Parameters:
    ///   - order: An `Int` representing the order in which the coach mark should appear relative to others.
    ///     This allows you to control the sequence of multiple coach marks.
    ///   - title: An optional `String` for the title of the coach mark. If `nil`, no title will be displayed.
    ///   - description: An optional `String` providing the descriptive text of the coach mark. If `nil`, no description will be displayed.
    ///   - highlightViewCornerRadius: A `CGFloat` value that defines the corner radius of the view being highlighted.
    ///   - scaleEffect: A `CGFloat` value that determines the scaling effect of the highlighted view when the coach mark is shown. The default       value is `1.2`.
    ///   - coachMarkBackGroundColor: A `Color` specifying the background color of the coach mark. The default color is white.
    ///   - customCoachMarkView: A closure that returns a custom `View` to be displayed inside the coach mark. This allows for full customization of the coach mark content.
    ///
    /// - Returns: A view that contains the anchor preference with the associated `Highlight` object,
    ///            which will be used by the coach mark manager to display the coach mark in the correct sequence and style.
    ///
    /// - Example:
    ///   ```swift
    ///   someView.showCoachMark(order: 1,
    ///                          title: "Title",
    ///                          description: "This is a description.",
    ///                          highlightViewCornerRadius: 8,
    ///                          coachMarkBackGroundColor: .white) {
    ///       VStack {
    ///           Text("Custom Content")
    ///           Image(systemName: "star.fill")
    ///       }
    ///   }
    ///   ```
    @ViewBuilder
    public func showCoachMark<Content: View>(order: Int,
                                             title: String? = nil,
                                             description: String? = nil,
                                             highlightViewCornerRadius: CGFloat,
                                             scaleEffect: CGFloat = 1.2,
                                             coachMarkBackGroundColor: Color = .white,
                                             customCoachMarkView: @escaping () -> Content) -> some View {
        self.anchorPreference(key: HighlightAnchorKey.self, value: .bounds) { anchor in
            let highlight = Highlight(anchor: anchor,
                                      title: title,
                                      description: description,
                                      highlightViewCornerRadius: highlightViewCornerRadius,
                                      scaleEffect: scaleEffect,
                                      coachMarkBackGroundColor: coachMarkBackGroundColor,
                                      customCoachMarkView: AnyView(customCoachMarkView()))
            return [order: highlight]
        }
    }
}

extension View {
    
    /// Applies a reverse mask to the view, revealing the shape of the provided content.
    ///
    /// This method uses a masking technique that effectively cuts out a portion of the view's content based on the shape provided by the `content` view. The area defined by the `content` view will be transparent, revealing the underlying layers or background.
    ///
    /// - Parameters:
    ///   - alignment: The alignment of the `content` within the mask. The default is `.topLeading`.
    ///   - content: A closure that returns the view defining the shape of the mask. This view will act as a cut-out, creating a transparent area in the parent view.
    ///
    /// - Returns: A view with the specified reverse mask applied.
    @ViewBuilder func reverseMask<Content: View>(alignment: Alignment = .topLeading, @ViewBuilder content: @escaping () -> Content) -> some View {
        self
            .mask {
                Rectangle()
                    .overlay(alignment: .topLeading) {
                        content()
                            .blendMode(.destinationOut)
                    }
            }
    }
    
}

extension View {
    
    /// Applies a modifier to style text as filled button text.
    ///
    /// This method adds the `FilledButtonTextModifier` to the view, which styles the text with a specified foreground color. This modifier is typically used to style the text of buttons that have a filled background.
    ///
    /// - Parameter foregroundStyle: The color to use for the text.
    /// - Returns: A view modified with the specified text styling for filled buttons.
    func filledButtonTextModifier(foregroundStyle: Color, font: Font) -> some View {
        self.modifier(FilledButtonTextModifier(foregroundStyle: foregroundStyle, font: font))
    }
}

extension View {
    
    /// Applies a modifier to style text as unfilled button text.
    ///
    /// This method adds the `UnFilledButtonTextModifier` to the view, which styles the text with a specified foreground color and stroke color. This modifier is typically used to style the text of buttons that do not have a filled background, often resulting in an outlined or border-only style.
    ///
    /// - Parameters:
    ///   - foregroundStyle: The color to use for the text.
    ///   - strokeColor: The color to use for the border or outline of the button.
    /// - Returns: A view modified with the specified text and border styling for unfilled buttons.
    func unFilledButtonTextModifier(foregroundStyle: Color, font: Font) -> some View {
        self.modifier(UnFilledButtonTextModifier(foregroundStyle: foregroundStyle, font: font))
    }
}

extension UIView {
    
    /// Recursively searches through the view's subviews to find and return the content view of a UIVisualEffectView, identified by the class name "_UIVisualEffectContentView".
    ///
    /// - Returns: The UIView representing the content view of a UIVisualEffectView, if found otherwise, returns nil.
    ///
    /// This method uses a recursive approach to traverse the view hierarchy, checking each subview to determine if it matches the desired class name. If the desired view is found, it is returned immediately. If not, the method continues searching through the subviews of each subview.
    func findUIVisualEffectContentView() -> UIView? {
        for subview in subviews {
            if NSStringFromClass(type(of: subview)).contains("_UIVisualEffectContentView") {
                return subview
            }
            if let foundView = subview.findUIVisualEffectContentView() {
                return foundView
            }
        }
        return nil
    }
}


extension View {
    
    /// Conditionally applies a view modifier or transformation based on a boolean condition.
    ///
    /// - Parameters:
    ///   - condition: A `Bool` value that determines whether the `content` closure should be applied to the view.
    ///   - content: A closure that takes the original view (`Self`) as a parameter and returns a modified `Content` view.
    ///
    /// - Returns: A view that either applies the transformation defined in the `content` closure or remains unchanged, depending on the `condition`.
    ///
    /// - Example:
    ///   ```swift
    ///   someView.check(isHighlighted) { view in
    ///       view.showCoachMark(order: 3, title: "Title of coachMark view", description: "Description of coachMark view", highlightViewCornerRadius: 0)
    ///   }
    ///   ```
    ///   In this example, if `isHighlighted` is `true`, the background color of `someView` will be changed to yellow.
    ///   If `isHighlighted` is `false`, the background color remains unchanged.
    @ViewBuilder public func check<Content: View>(_ condition: Bool, content: (Self) -> Content) -> some View {
        if condition {
            content(self)
        } else {
            self
        }
    }
    
}

extension View {
    
    /// Conditionally applies a transformation to a view based on a boolean condition.
    ///
    /// - Parameters:
    ///   - condition: A `Bool` value that determines whether the `transform` closure should be applied to the view.
    ///   - transform: A closure that takes the original view (`Self`) as a parameter and returns a modified `Content` view.
    ///
    /// - Returns: A view that either applies the transformation defined in the `transform` closure or remains unchanged, depending on the `condition`.
    ///
    /// - Example:
    ///   ```swift
    ///   someView.if(isHighlighted) { view in
    ///       view.showCoachMark(order: 3, title: "Title of coachMark view", description: "Description of coachMark view", highlightViewCornerRadius: 0)
    ///   }
    ///   ```
    ///   In this example, if `isHighlighted` is `true`, the background color of `someView` will be changed to yellow.
    ///   If `isHighlighted` is `false`, the background color remains unchanged.
    @ViewBuilder public func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
    
}

extension View {
    
    /// Applies a custom transformation to the current view using a `ViewBuilder`.
    ///
    
    /// - Parameter transform: A closure that takes the current view (`Self`) as an argument
    ///   and returns a transformed view of type `Content`. The closure can include any
    ///   SwiftUI view or combination of views.
    ///
    /// - Returns: The transformed view of type `Content`, as specified by the `transform` closure.
    ///
    /// # Example Usage:
    /// ```
    ///  Text("Hello, World!")
    ///      .modify {
    ///          $0
    ///          font(.largeTitle)
    ///              .foregroundColor(.blue)
    ///              .padding()
    ///       }
    /// ```
    /// In this example, the `modify` function is used to apply multiple view modifiers
    func modify<Content>(@ViewBuilder _ transform: (Self) -> Content) -> Content {
        transform(self)
    }
    
}
