//
//  ContentView.swift
//  SSCoachMarksDemo
//
//  Created by Yagnik Bavishi on 09/08/24.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Variables
    @StateObject var coachMarkViewModel = CoachMarkViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                SearchTextField()
                    .padding()
                
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(Array(sampleEmails.enumerated()), id: \.element.id) { index, email in
                            EmailRow(email: sampleEmails[index], isShowCaseRow: index == 1)
                                .check(index == 5) { view in
                                    // Example of showing coach mark for index - 5 row from list
                                    view.showCoachMark(order: 5, description: "This is information related to you will get the 20% off in next purchase.", highlightViewCornerRadius: 0, scaleEffect: 1)
                                }
                                .frame(maxWidth: .infinity)
                                .background(Color.white)
                                .clipped()
                        }
                    }
                }
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        // Action to perform when button is tapped
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .frame(width: 24, height: 24)
                            .padding()
                            .background(Color("customBackgroundColor"))
                            .cornerRadius(30)
                            .shadow(radius: 10)
                    }
                    .showCoachMark(order: 6, description: "Tap to Floating Button to get the more information.", highlightViewCornerRadius: 30)
                    .padding(.trailing, 20)
                }
            }
        }
        
        
        // This modifier needs to be added to the main parent view to start the coach mark sequence.
        .modifier(CoachMarkView(isShowCoachMark: true,
                                isAutoTransition: true,
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
        })
                  /*
                   
                   Below Modifier is example of customising coach mark view
                   
                   .coachMarkTitleViewStyle(foregroundStyle: .yellow, fontSize: 12, fontWeight: .bold)
                   .coachMarkDescriptionViewStyle(foregroundStyle: .pink, fontSize: 12, fontWeight: .bold)
                   .overlayStyle(overlayColor: .black, overlayOpacity: 0.7)
                   .nextButtonStyle(foregroundStyle: .black, backgroundColor: .green, fontSize: 12, fontWeight: .bold)
                   .backButtonStyle(foregroundStyle: .black, backgroundColor: .green, fontSize: 12, fontWeight: .bold)
                   .doneButtonStyle(foregroundStyle: .black, backgroundColor: .green, fontSize: 12, fontWeight: .bold)
                   .skipCoachMarkButtonStyle(buttonText: "Skip", foregroundStyle: .black, backgroundColor: .green, fontSize: 12, fontWeight: .bold) */ )
    }
    
    // MARK: - Private Views
    private struct skipButtonView: View {
        
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
    
    private struct nextButtonView: View {
        
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
    ContentView()
}
