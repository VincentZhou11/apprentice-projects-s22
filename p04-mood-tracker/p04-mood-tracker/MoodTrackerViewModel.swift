//
//  ContentViewModel.swift
//  p04-mood-tracker
//
//  Created by Vincent Zhou on 1/24/22.
//

import Foundation

class MoodTrackerViewModel: ObservableObject {
    @Published var checkInText: String = ""
    @Published var checkInList: [MoodCheckIn] = []
    
    func addCheckIn() {
        checkInList.insert(MoodCheckIn(mood: checkInText, timestamp: Date.now), at: 0)
    }
}
