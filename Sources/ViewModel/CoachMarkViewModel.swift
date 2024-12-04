//
//  CoachMarkViewModel.swift
//  SSCoachMarksDemo
//
//  Created by Yagnik Bavishi on 12/08/24.
//

import SwiftUI

public class CoachMarkViewModel: ObservableObject {
    
    // MARK: - Published Variables
    
    /// A Boolean value that determines whether the Coach Mark should be shown. Defaults to `false`.
    @Published var showCoachMark: Bool
    
    ///  An integer value representing the index of the currently highlighted item in the Coach Mark sequence. Defaults to `0`.
    @Published var currentHighlight: Int
    
    /// A Boolean value that determines whether the Coach Mark should be hidden automatically. Defaults to `true`.
    @Published var hideCoachMark: Bool
    
    ///A closure that is called when the Coach Mark sequence is finished. Defaults to an empty closure.
    @Published var onCoachMarkFinished: () -> ()
    
    // MARK: - Initializer
    
    /// Initializes a new instance of the class with optional parameters to control the visibility
    /// and state of the Coach Mark.
    ///
    /// - Parameters:
    ///   - showCoachMark: A Boolean value that determines whether the Coach Mark should be shown. Defaults to `false`.
    ///   - currentHighlight: An integer value representing the index of the currently highlighted item in the Coach Mark sequence. Defaults to `0`.
    ///   - hideCoachMark: A Boolean value that determines whether the Coach Mark should be hidden automatically. Defaults to `true`.
    ///   - onCoachMarkFinished: A closure that is called when the Coach Mark sequence is finished. Defaults to an empty closure.
    init(showCoachMark: Bool = false,
         currentHighlight: Int = 0,
         hideCoachMark: Bool = true,
         onCoachMarkFinished: @escaping () -> () = {}) {
        self.showCoachMark = showCoachMark
        self.currentHighlight = currentHighlight
        self.hideCoachMark = hideCoachMark
        self.onCoachMarkFinished = onCoachMarkFinished
    }
    
    // MARK: - Public Functions
    
    /// Handles the action for the "Next" button in the Coach Mark sequence.
    ///
    /// This function hides the current Coach Mark with an animation, increments the `currentHighlight` to move to the next item, and then shows the next Coach Mark after a brief delay.
    ///
    /// The sequence of actions includes:
    /// 1. Animating the hiding of the current Coach Mark with an ease-out effect.
    /// 2. Incrementing the `currentHighlight` index to highlight the next item.
    /// 3. Re-displaying the Coach Mark after a specified delay, allowing for a smooth transition.
    ///
    /// The delay and animation duration are hardcoded in the function.
    public func nextButtonAction() {
        withAnimation(.easeOut(duration: Constants.buttonClickedAnimationDelay)) {
            showCoachMark = false
            currentHighlight += 1
        }
        updateAfterDelay(delay: Constants.showCoachMarkViewDelay) {
            self.showCoachMark = true
        }
    }
    
    /// Handles the action for the "Back" button in the Coach Mark sequence.
    ///
    /// This function hides the current Coach Mark with an animation, decrements the `currentHighlight` to move to the previous item, and then shows the previous Coach Mark after a brief delay.
    ///
    /// The sequence of actions includes:
    /// 1. Animating the hiding of the current Coach Mark with an ease-out effect.
    /// 2. Decrementing the `currentHighlight` index to highlight the previous item.
    /// 3. Re-displaying the Coach Mark after a specified delay, allowing for a smooth transition.
    ///
    /// The delay and animation duration are hardcoded in the function.
    public func backButtonAction() {
        withAnimation(.easeOut(duration: Constants.buttonClickedAnimationDelay)) {
            showCoachMark = false
            currentHighlight -= 1
        }
        updateAfterDelay(delay: Constants.showCoachMarkViewDelay) {
            self.showCoachMark = true
        }
    }
    
    /// Completes the Coach Mark sequence and triggers the when done button actions trigger.
    public func doneButtonAction() {
        finishCoachMark()
    }
    
    /// Completes the Coach Mark sequence and triggers the when skip coach mark  button actions trigger.
    public func skipCoachMark() {
        finishCoachMark()
    }
    
    /// Completes the Coach Mark sequence and triggers the final actions.
    ///
    /// This function hides the Coach Mark with an animation and then calls the `onCoachMarkFinished` closure to execute any final tasks or cleanup operations after the Coach Mark sequence has ended.
    ///
    /// The sequence of actions includes:
    /// 1. Animating the hiding of the Coach Mark with an ease-in-out effect.
    /// 2. Triggering the `onCoachMarkFinished` closure to signal the completion of the Coach Mark sequence.
    ///
    /// The animation duration is hardcoded in the function.
    public func finishCoachMark() {
        withAnimation(.easeInOut(duration: Constants.buttonClickedAnimationDelay)) {
            hideCoachMark = false
        }
        onCoachMarkFinished()
    }
    
}
