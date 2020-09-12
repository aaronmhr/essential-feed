//
//  XCTCase+MemoryLeakTracking.swift
//  EssentialFeedTests
//
//  Created by Aaron Huánuco on 12/09/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import XCTest

extension XCTestCase {
    func trackForMemoryLeaks(_ instance: AnyObject, file: StaticString = #file, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should have been deallocated. Potentially memory leak", file: file, line: line)
        }
    }
}
