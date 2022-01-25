//
//  Mood.swift
//  p04-mood-tracker
//
//  Created by Vincent Zhou on 1/24/22.
//

import Foundation

struct MoodCheckIn: Identifiable {
    var id = UUID()
    var mood: String
    var timestamp: Date
    var formattedDate: String {
        return timestamp.formatted(Date.FormatStyle().month().day().year().hour().minute())
    }
}
