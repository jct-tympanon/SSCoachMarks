//
//  DefaultStyleView.swift
//  SSCoachMarksDemo
//
//  Created by Yagnik Bavishi on 14/08/24.
//

import SwiftUI

struct DefaultStyleView: View {
    
    // MARK: - Variables
    @StateObject var coachMarkViewModel = CoachMarkViewModel()
    
    var body: some View {
        commonView
        // This modifier needs to be added to the main parent view to start the coach mark sequence.
        .modifier(CoachMarkView(isShowCoachMark: true,
                                isAutoTransition: false,
                                coachMarkViewModel: coachMarkViewModel,
                                onCoachMarkFinished: {
            print("Finished...")
        }))
    }
}

#Preview {
    DefaultStyleView()
}
