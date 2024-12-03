//
//  DefaultStyleWithCustomizationView.swift
//  SSCoachMarksDemo
//
//  Created by Yagnik Bavishi on 14/08/24.
//

import SwiftUI

struct DefaultStyleWithCustomizationView: View {
    
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
        })
            .coachMarkTitleViewStyle(foregroundStyle: .blue, fontSize: 14, fontWeight: .bold)
            .coachMarkDescriptionViewStyle(foregroundStyle: .pink, fontSize: 14, fontWeight: .bold)
            .overlayStyle(overlayColor: .black, overlayOpacity: 0.5)
            .nextButtonStyle(foregroundStyle: .black, backgroundColor: .green, fontSize: 14, fontWeight: .bold)
            .backButtonStyle(foregroundStyle: .black, backgroundColor: .green, fontSize: 14, fontWeight: .bold)
            .doneButtonStyle(foregroundStyle: .black, backgroundColor: .green, fontSize: 14, fontWeight: .bold)
            .skipCoachMarkButtonStyle(foregroundStyle: .black, backgroundColor: .green, fontSize: 14, fontWeight: .bold))
    }
}

#Preview {
    DefaultStyleWithCustomizationView()
}
