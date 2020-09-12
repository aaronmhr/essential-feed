//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Aaron Huánuco on 12/09/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
