//
//  CrewMember.swift
//  p02-apollo
//
//  Created by Samuel Shi on 1/11/22.
//

import Foundation

struct CrewMember: Codable {
    let id: String
    let name: String
    let role: String

    var imageName: String {
        return id
    }
}

extension CrewMember {
    static var example: CrewMember {
        CrewMember(id: "armstrong",
                   name: "Neil A. Armstrong",
                   role: "Commander")
    }
    static var example2: CrewMember {
        CrewMember(id: "collins",
                   name: "Michael Collins",
                   role: "Command Module Pilot")
    }
}
