//
//  ContentView.swift
//  p04-mood-tracker
//
//  Created by Samuel Shi on 1/17/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var moodTrackerViewModel = MoodTrackerViewModel()
    
    var body: some View {
        Form {
            Section(header: Text("New Check-In")) {
                HStack {
                    TextField("How are you feeling", text: $moodTrackerViewModel.checkInText)
                    Button {
                        moodTrackerViewModel.addCheckIn()
                    } label: {
                        Text("Save")
                    }
                }
            }
            Section(header: Text("Previous Check-Ins")) {
                List(moodTrackerViewModel.checkInList, id: \.id) { moodCheckIn in
                    VStack(alignment:.leading) {
                        Text(moodCheckIn.mood)
                        Text(moodCheckIn.formattedDate).foregroundColor(.secondary).font(.caption)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
