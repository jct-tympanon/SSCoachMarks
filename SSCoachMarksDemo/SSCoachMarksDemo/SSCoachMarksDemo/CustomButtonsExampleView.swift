//
//  CustomButtonsExampleView.swift
//  SSCoachMarksDemo
//
//  Created by Yagnik Bavishi on 13/08/24.
//

import SwiftUI

struct CustomButtonsExampleView: View {
    
    // MARK: - Variables
    @StateObject var coachMarkViewModel = CoachMarkViewModel()
    
    var body: some View {
        commonView
        // This modifier needs to be added to the main parent view to start the coach mark sequence.
        .modifier(CoachMarkView(isShowCoachMark: true,
                                isAutoTransition: false,
                                coachMarkViewModel: coachMarkViewModel,
                                skipCoachMarkButton: AnyView(
                                    skipButtonView(coachMarkViewModel: coachMarkViewModel)
                                ),
                                nextButtonContent: AnyView(
                                    nextButtonView(coachMarkViewModel: coachMarkViewModel)
                                ),
                                backButtonContent: AnyView(
                                    backButtonView(coachMarkViewModel: coachMarkViewModel)
                                ),
                                doneButtonContent: AnyView(
                                    doneButtonView(coachMarkViewModel: coachMarkViewModel)
                                ),
                                onCoachMarkFinished: {
            print("Finished...")
        }))
    }
    
    // MARK: - Private Views
    private struct skipButtonView: View {
        
        // MARK: - Variables
        @ObservedObject var coachMarkViewModel: CoachMarkViewModel
        
        var body: some View {
            Button(action: {
                coachMarkViewModel.skipCoachMark()
            }) {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .frame(width: 24, height: 24)
                    .padding()
                    .background(Color("customBackgroundColor"))
                    .cornerRadius(30)
                    .shadow(radius: 10)
            }
        }
    }
    
    private struct nextButtonView: View {
        
        // MARK: - Variables
        @ObservedObject var coachMarkViewModel: CoachMarkViewModel
        
        var body: some View {
            Button(action: {
                coachMarkViewModel.nextButtonAction()
            }) {
                Image(systemName: "arrow.forward")
                    .foregroundColor(.white)
                    .frame(width: 24, height: 24)
                    .padding()
                    .background(Color("customBackgroundColor"))
                    .cornerRadius(30)
                    .shadow(radius: 10)
            }
        }
    }
    
    private struct backButtonView: View {
        
        // MARK: - Variables
        @ObservedObject var coachMarkViewModel: CoachMarkViewModel
        
        var body: some View {
            Button(action: {
                coachMarkViewModel.backButtonAction()
            }) {
                Image(systemName: "arrow.backward")
                    .foregroundColor(.white)
                    .frame(width: 24, height: 24)
                    .padding()
                    .background(Color("customBackgroundColor"))
                    .cornerRadius(30)
                    .shadow(radius: 10)
            }
        }
    }
    
    private struct doneButtonView: View {
        
        // MARK: - Variables
        @ObservedObject var coachMarkViewModel: CoachMarkViewModel
        
        var body: some View {
            Button(action: {
                coachMarkViewModel.doneButtonAction()
            }) {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .frame(width: 24, height: 24)
                    .padding()
                    .background(Color("customBackgroundColor"))
                    .cornerRadius(30)
                    .shadow(radius: 10)
            }
        }
    }
}

#Preview {
    CustomButtonsExampleView()
}
