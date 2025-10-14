//
//  SSCoachMarkManager.swift
//  CoachworkDemo
//
//  Created by Yagnik Bavishi on 08/08/24.
//

import Foundation

//MARK: - SSCoachMarkManager
/// Manages the configuration and behaviour of CoachMark components.
/// This class provides direct access to the configuration and facilitates the setup and customisation of CoachMark views.
@available(macOS 15.0, *)
final class SSCoachMarkManager {
    
    /// The configuration used to style and control the behaviour of the CoachMark.
    public var configuration: SSCoachMarkConfiguration
    
    /// Initializes a new `SSCoachMarkManager` instance with the specified configuration.
    ///
    /// - Parameter configuration: An instance of `SSCoachMarkConfiguration` that defines the appearance and behaviour of the CoachMark.
    ///   If no configuration is provided, a default `SSCoachMarkConfiguration` instance is used.
    public init(configuration: SSCoachMarkConfiguration = SSCoachMarkConfiguration()) {
        self.configuration = configuration
    }
}
