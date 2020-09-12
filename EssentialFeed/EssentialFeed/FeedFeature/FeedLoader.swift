//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Aaron Huánuco on 11/09/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
