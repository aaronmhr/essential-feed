//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Aaron Huánuco on 13/09/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import Foundation

func anyNSError() ->  NSError {
    NSError(domain: "any error", code: 0)
}

func anyURL() -> URL {
    URL(string: "https://any-url.com")!
}
