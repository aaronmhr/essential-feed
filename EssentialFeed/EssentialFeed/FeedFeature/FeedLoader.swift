//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Aaron Huánuco on 11/09/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import Foundation


public protocol FeedLoader {
    typealias Result = Swift.Result<[FeedImage], Error>
    
    func load(completion: @escaping (Result) -> Void)
}
