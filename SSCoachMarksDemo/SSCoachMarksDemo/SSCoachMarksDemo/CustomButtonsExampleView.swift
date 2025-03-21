//
//  CustomButtonsExampleView.swift
//  SSCoachMarksDemo
//
//  Created by Yagnik Bavishi on 13/08/24.
//

import SwiftUI

struct CustomButtonsExampleView: View {
    
    // MARK: - Variables
    @State var buttonEventsCoordinator = ButtonEventsCoordinator()
    
    var body: some View {
        commonView
        // This modifier needs to be added to the main parent view to start the coach mark sequence.
            .modifier(CoachMarkView(buttonEventsCoordinator: buttonEventsCoordinator,
                                    skipCoachMarkButton: AnyView(skipButtonView(buttonEventsCoordinator: buttonEventsCoordinator)),
                                    nextButtonContent: AnyView(nextButtonView(buttonEventsCoordinator: buttonEventsCoordinator)),
                                    backButtonContent: AnyView(backButtonView(buttonEventsCoordinator: buttonEventsCoordinator)),
                                    doneButtonContent: AnyView(doneButtonView(buttonEventsCoordinator: buttonEventsCoordinator)),
                                    onCoachMarkFinished: {
                print("Finished...")
            }))
    }
    
    // MARK: - Private Views
    private struct skipButtonView: View {
        
        // MARK: - Variables
        let buttonEventsCoordinator: ButtonEventsCoordinator
        
        var body: some View {
            Button(action: {
                buttonEventsCoordinator.buttonEventTriggerType(eventType: .skip)
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
        let buttonEventsCoordinator: ButtonEventsCoordinator
        
        var body: some View {
            Button(action: {
                buttonEventsCoordinator.buttonEventTriggerType(eventType: .next)
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
        let buttonEventsCoordinator: ButtonEventsCoordinator
        
        var body: some View {
            Button(action: {
                buttonEventsCoordinator.buttonEventTriggerType(eventType: .back)
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
        let buttonEventsCoordinator: ButtonEventsCoordinator
        
        var body: some View {
            Button(action: {
                buttonEventsCoordinator.buttonEventTriggerType(eventType: .done)
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
