//
//  MilesRanViewModel.swift
//  p07-runny
//
//  Created by Vincent Zhou on 3/8/22.
//

import Foundation


class MilesRanViewModel: ObservableObject {
    @Published var milesRan: Double
    
    init () {
        milesRan = MilesRanStore.fetchMiles()
    }
    
    func increment (amount: Double) {
        milesRan += amount
        MilesRanStore.save(miles: milesRan)
    }
    func decrement (amount: Double) {
        milesRan -= amount
        MilesRanStore.save(miles: milesRan)
    }
}
