//
//  MilesRanStore.swift
//  p07-runny
//
//  Created by Vincent Zhou on 3/8/22.
//

import Foundation
import WidgetKit

struct MilesRanStore {
    static private let milesRanKey = "milesRan"
    static private let milesDelta = "milesDelta"
    static private let milesDate = "milesDate"
    static private let defaults = UserDefaults(suiteName: "group.com.vincentzhou.p07-runny.contents")!
    static func save(miles: Double) {
//        let defaults = UserDefaults.standard
        defaults.set(miles, forKey:milesRanKey)
        defaults.set(miles - defaults.double(forKey: milesRanKey), forKey:milesDelta)
        defaults.set(Date().timeIntervalSince1970, forKey: milesDate)
        WidgetCenter.shared.reloadAllTimelines()
    }
    static func fetchMiles() -> Double {
//        let defaults = UserDefaults.standard
        return defaults.double(forKey: milesRanKey)
    }
    static func fetchDeltaMiles() -> Double {
        return defaults.double(forKey: milesDelta)
    }
    static func fetchMilesDate() -> Date {
        return Date(timeIntervalSince1970: defaults.double(forKey: milesDate))
    }
}
