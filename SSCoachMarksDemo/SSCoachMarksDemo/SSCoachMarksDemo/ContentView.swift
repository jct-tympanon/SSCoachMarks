//
//  ContentView.swift
//  SSCoachMarksDemo
//
//  Created by Yagnik Bavishi on 09/08/24.
//

import SwiftUI

struct ContentView: View {

    // MARK: - Variables
    @State private var isAutoTransitionExample = false
    @State private var isCustomButtonsExampleView = false
    @State private var isDefaultStyleView = false
    @State private var isDefaultStyleViewWithCustomization = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Text("Demo Example")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 50)
                  
                Group {
                    NavigationButton(
                        title: "Default Style",
                        isPresented: $isDefaultStyleView,
                        destination: DefaultStyleView(),
                        backgroundColor: Color("customBackgroundColor")
                    )

                    NavigationButton(
                        title: "Default Style With Customization",
                        isPresented: $isDefaultStyleViewWithCustomization,
                        destination: DefaultStyleWithCustomizationView(),
                        backgroundColor: Color("customBackgroundColor")
                    )

                    NavigationButton(
                        title: "Auto Transition Example",
                        isPresented: $isAutoTransitionExample,
                        destination: AutoTransitionExample(),
                        backgroundColor: Color("customBackgroundColor")
                    )

                    NavigationButton(
                        title: "Custom Buttons Example",
                        isPresented: $isCustomButtonsExampleView,
                        destination: CustomButtonsExampleView(),
                        backgroundColor: Color("customBackgroundColor")
                    )
                }
                .frame(width: 290)
                .cornerRadius(10)
                .padding(.horizontal, 20)
                Spacer()
            }
            .padding()
        }
    }
}

// MARK: - NavigationButton View
struct NavigationButton<Destination: View>: View {
    
    // MARK: - Variables
    let title: String
    @Binding var isPresented: Bool
    let destination: Destination
    let backgroundColor: Color

    var body: some View {
        Button(action: {
            isPresented = true
        }) {
            Text(title)
                .filledButtonTextModifier(foregroundStyle: .white, font: .subheadline)
        }
        .frame(width: 290)
        .background(backgroundColor)
        .cornerRadius(10)
        .navigationDestination(isPresented: $isPresented) {
            destination
                .navigationTitle(title)
        }
    }
}

#Preview {
    ContentView()
}
