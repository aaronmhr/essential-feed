//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Aaron Huánuco on 11/09/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import Foundation

public enum LoadFeedResult<Error: Swift.Error> {
    case success([FeedItem])
    case failure(Error)
}

extension LoadFeedResult: Equatable where Error: Equatable { }

public protocol FeedLoader {
    associatedtype Error: Swift.Error
    func load(completion: @escaping (LoadFeedResult<Error>) -> Void)
}
