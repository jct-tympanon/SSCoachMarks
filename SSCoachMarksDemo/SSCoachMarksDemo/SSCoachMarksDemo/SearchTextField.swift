//
//  SearchTextField.swift
//  SSCoachMarksDemo
//
//  Created by Yagnik Bavishi on 09/08/24.
//

import SwiftUI

struct SearchTextField: View {
    
    // MARK: - Variables
    @State private var searchText: String = ""

    var body: some View {
        HStack {
            HStack {
                Button(action: {
                    // Handle menu action
                }) {
                    Image(systemName: "line.horizontal.3")
                        .foregroundColor(Color("customBackgroundColor"))
                }
                // From here coach mark is started
                // Below Example is showing coach mark view with title and description
                .showCoachMark(order: 0, title: "Menu items", description: "Click Here to see more menu item", highlightViewCornerRadius: 5)

                .padding(.leading, 8)

                TextField("Search...", text: $searchText)
                    .padding(8)
                    .cornerRadius(8)
                    .padding(.horizontal, 8)

                Button(action: {
                    // Handle search action
                }) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color("customBackgroundColor"))
                }
                // Below Example is showing coach mark view only description
                .showCoachMark(order: 1, description: "This image view is typically used as part of a search bar or search field in the UI. It indicates to the user that they can enter text to search for items within a list. When the user taps or clicks on the search icon, it can trigger the display of a text input field where the user can type their search query.", highlightViewCornerRadius: 5, coachMarkBackGroundColor: Color("backgroundColor").opacity(0.5))
                .padding(.trailing, 8)
            }
            .background(Color(.systemGray5))
            .cornerRadius(10)
            .padding(.horizontal, 10)
            Image("simformlogo")
                .resizable()
                .frame(width: 40, height: 40)
        }
    }
}

#Preview {
    SearchTextField()
}
