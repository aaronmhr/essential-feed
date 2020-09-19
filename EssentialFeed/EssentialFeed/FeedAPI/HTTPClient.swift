//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Aaron Huánuco on 12/09/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import Foundation

public protocol HTTPClient {
    typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>
    /// The completion handler can be invoked in any thread.
    /// Clients are responsible to dispatch to appropriate threads, if needed.
    func get(from url: URL, completion: @escaping (Result) -> Void)
}
