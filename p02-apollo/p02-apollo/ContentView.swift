//
//  ContentView.swift
//  p02-apollo
//
//  Created by Samuel Shi on 1/11/22.
//

import SwiftUI

struct ContentView: View {
    // use this array of missions to show your mission content
    let missions: [Mission] = Bundle.main.decode("missions.json")

    var body: some View {
        NavigationView {
            List(missions, id: \.id) { mission in
                
                NavigationLink {
                    MissionDetailView(mission: mission)
                } label: {
                    HStack {
                        Image(mission.imageName).resizable()
                            .scaledToFit().frame(width: 50, height: 50)
                        VStack(alignment:.leading) {
                            Text(mission.displayName)
                            Text(mission.launchDate?.formatted(Date.FormatStyle().month().day().year()) ?? "N/A").foregroundColor(.secondary)
                        }
                    }
                }
            }.navigationTitle(Text("NASA Missions"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().colorScheme(.dark)
    }
}
