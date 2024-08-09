//
//  EmailRow.swift
//  SSCoachMarksDemo
//
//  Created by Yagnik Bavishi on 09/08/24.
//

import SwiftUI

struct EmailRow: View {
    
    // MARK: - Variables
    let email: Email
    let isShowCaseRow: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: email.avatar)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .foregroundStyle(Color("customBackgroundColor").opacity(0.8))
                    // Example of showing coach mark for specific row image 
                    .if(isShowCaseRow) { content in
                        content.showCoachMark(order: 2, highlightViewCornerRadius: 50) {
                            profileView
                        }
                    }
                    .padding(.horizontal, 10)


                VStack(alignment: .leading, spacing: 4) {
                    Text(email.senderName)
                        .font(.headline)
                        .foregroundStyle(Color("customBackgroundColor").opacity(0.8))
                    Text(email.snippet)
                        .font(.body)
                        .lineLimit(2)
                        .foregroundColor(.black)
                }

                Spacer()

                Text(email.date)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .if(isShowCaseRow) { content in
                        content.showCoachMark(order: 3, title: "Title of coachMark view", description: "Description of coachMark view", highlightViewCornerRadius: 0)
                    }
            }
        }

        .padding(.vertical, 12)
        .padding(.horizontal, 10)
    }

    // MARK: - Private Views
    private var profileView: some View {
        VStack(spacing: 2) {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(Color("customBackgroundColor"))
            Text("Custom View")
                .font(.system(size: 12))
                .foregroundColor(.black)
        }
    }
}
