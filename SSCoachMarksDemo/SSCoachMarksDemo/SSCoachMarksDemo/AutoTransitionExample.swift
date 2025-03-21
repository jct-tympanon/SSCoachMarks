//
//  AutoTransitionExample.swift
//  SSCoachMarksDemo
//
//  Created by Yagnik Bavishi on 13/08/24.
//

import SwiftUI

struct AutoTransitionExample: View {
    
    // MARK: - Variables
    
    var body: some View {
        commonView
        // This modifier needs to be added to the main parent view to start the coach mark sequence.
        .modifier(CoachMarkView(isAutoTransition: true,
                                autoTransitionDuration: 3,
                                onCoachMarkFinished: {
            print("Finished...")
        }))
    }

}

#Preview {
    AutoTransitionExample()
}
