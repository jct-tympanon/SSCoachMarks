//
//  CommonView.swift
//  SSCoachMarksDemo
//
//  Created by Yagnik Bavishi on 14/08/24.
//

import SwiftUI

var commonView: some View {
    
    ZStack {
        VStack {
            SearchTextField()
                .padding()
            
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(Array(sampleEmails.enumerated()), id: \.element.id) { index, email in
                        EmailRow(email: sampleEmails[index], isShowCaseRow: index == 1)
                            .check(index == 4) { view in
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
}
