//
//  FeedCachePolicy.swift
//  EssentialFeed
//
//  Created by Aaron Huánuco on 14/09/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import Foundation

internal final class FeedCachePolicy {
    private init() {}

    private static let calendar = Calendar(identifier: .gregorian)
    private static var maxCacheAgeInDays: Int { 7 }

    internal static func validate(_ timestamp: Date, against date: Date) -> Bool {
        guard let maxCacheAge = calendar.date(byAdding: .day, value: maxCacheAgeInDays, to: timestamp) else {
            return false
        }
        return date < maxCacheAge
    }
}
