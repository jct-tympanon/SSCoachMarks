//
//  EmailModel.swift
//  SSCoachMarksDemo
//
//  Created by Yagnik Bavishi on 09/08/24.
//

import Foundation

struct Email: Identifiable {
    
    // MARK: - Variables
    let id = UUID()
    let senderName: String
    let senderEmail: String
    let snippet: String
    let date: String
    let avatar: String
    
}

// Sample data for demo example
let sampleEmails: [Email] = [
    Email(senderName: "John Doe", senderEmail: "john.doe@example.com", snippet: "Don't forget about our meeting tomorrow at 10 AM.", date: "Jul 6", avatar: "person.circle"),
    Email(senderName: "Jane Smith", senderEmail: "jane.smith@example.com", snippet: "Would you like to grab lunch tomorrow?", date: "Jul 5", avatar: "person.circle.fill"),
    Email(senderName: "Acme Corp", senderEmail: "noreply@acme.com", snippet: "Get 20% off on your next purchase.", date: "Jul 4", avatar: "briefcase.fill"),
    Email(senderName: "John Doe", senderEmail: "john.doe@example.com", snippet: "Don't forget about our meeting tomorrow at 10 AM.", date: "Jul 6", avatar: "person.circle"),
    Email(senderName: "Jane Smith", senderEmail: "jane.smith@example.com", snippet: "Would you like to grab lunch tomorrow?", date: "Jul 5", avatar: "person.circle.fill"),
    Email(senderName: "Acme Corp", senderEmail: "noreply@acme.com", snippet: "Get 20% off on your next purchase.", date: "Jul 4", avatar: "briefcase.fill"),
    Email(senderName: "John Doe", senderEmail: "john.doe@example.com", snippet: "Don't forget about our meeting tomorrow at 10 AM.", date: "Jul 6", avatar: "person.circle"),
    Email(senderName: "Jane Smith", senderEmail: "jane.smith@example.com", snippet: "Would you like to grab lunch tomorrow?", date: "Jul 5", avatar: "person.circle.fill"),
    Email(senderName: "Acme Corp", senderEmail: "noreply@acme.com", snippet: "Get 20% off on your next purchase.", date: "Jul 4", avatar: "briefcase.fill"),
    Email(senderName: "John Doe", senderEmail: "john.doe@example.com", snippet: "Don't forget about our meeting tomorrow at 10 AM.", date: "Jul 6", avatar: "person.circle"),
    Email(senderName: "Jane Smith", senderEmail: "jane.smith@example.com", snippet: "Would you like to grab lunch tomorrow?", date: "Jul 5", avatar: "person.circle.fill"),
    Email(senderName: "Acme Corp", senderEmail: "noreply@acme.com", snippet: "Get 20% off on your next purchase.", date: "Jul 4", avatar: "briefcase.fill")
]
