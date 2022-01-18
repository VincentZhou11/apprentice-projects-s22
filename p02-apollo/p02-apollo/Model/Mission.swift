//
//  Mission.swift
//  Moonshot
//
//  Created by hawkeyeshi on 6/23/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import Foundation

struct Mission: Codable, Identifiable {
    let id: Int
    let launchDate: Date?
    let crew: [CrewMember]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var imageName: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        }
        return "N/A"
    }
}

extension Mission {
    static var example: Mission {
        Mission(id: 11,
                launchDate: Date(),
                crew: [.example, .example2],
                description: "Apollo 11 was the spaceflight that first landed humans on the Moon. Commander Neil Armstrong and lunar module pilot Buzz Aldrin formed the American crew that landed the Apollo Lunar Module Eagle on July 20, 1969, at 20:17 UTC.\n\nArmstrong became the first person to step onto the lunar surface six hours and 39 minutes later on July 21 at 02:56 UTC; Aldrin joined him 19 minutes later. They spent about two and a quarter hours together outside the spacecraft, and they collected 47.5 pounds (21.5 kg) of lunar material to bring back to Earth.\n\nCommand module pilot Michael Collins flew the command module Columbia alone in lunar orbit while they were on the Moon's surface. Armstrong and Aldrin spent 21 hours 31 minutes on the lunar surface at a site they named Tranquility Base before lifting off to rejoin Columbia in lunar orbit.")
    }
}
