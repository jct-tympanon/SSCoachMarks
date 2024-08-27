//
//  AutoTransitionExample.swift
//  SSCoachMarksDemo
//
//  Created by Yagnik Bavishi on 13/08/24.
//

import SwiftUI

struct AutoTransitionExample: View {
    
    // MARK: - Variables
    @StateObject var coachMarkViewModel = CoachMarkViewModel()
    
    var body: some View {
        commonView
        // This modifier needs to be added to the main parent view to start the coach mark sequence.
        .modifier(CoachMarkView(isShowCoachMark: true,
                                isAutoTransition: true,
                                autoTransitionDuration: 3,
                                coachMarkViewModel: coachMarkViewModel,
                                onCoachMarkFinished: {
            print("Finished...")
        }))
    }
    
    private struct skipButtonView: View {
        
        // MARK: - Variables
        @ObservedObject var coachMarkViewModel: CoachMarkViewModel
        
        var body: some View {
            Button(action: {
                coachMarkViewModel.skipCoachMark()
            }) {
                Text("Skip")
                    .foregroundColor(.white)
                    .frame(width: 50, height: 24)
                    .padding()
                    .background(Color("customBackgroundColor"))
                    .cornerRadius(30)
                    .shadow(radius: 10)
            }
        }
    }
}

#Preview {
    AutoTransitionExample()
}
