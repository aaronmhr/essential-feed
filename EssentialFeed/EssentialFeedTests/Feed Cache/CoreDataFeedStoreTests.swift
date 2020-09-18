//
//  CoreDataFeedStoreTests.swift
//  EssentialFeedTests
//
//  Created by Aaron Huánuco on 17/09/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import XCTest
import CoreData
import EssentialFeed

final class CoreDataFeedStoreTests: XCTestCase, FailableFeedStoreSpecs {
    func test_retrieve_deliversEmptyOnEmptyCache() {
        let sut = makeSUT()

        assertThatRetrieveDeliversEmptyOnEmptyCache(on: sut)
    }

    func test_retrieve_hasNoSideEffectsOnEmptyCache() {
        let sut = makeSUT()

        assertThatRetrieveHasNoSideEffectsOnEmptyCache(on: sut)
    }

    func test_retrieve_deliversFoundValuesOnNonEmptyCache() {
        let sut = makeSUT()

        assertThatRetrieveDeliversFoundValuesOnNonEmptyCache(on: sut)
    }

    func test_retrieve_hasNoSideEffectsOnNonEmptyCache() {
        let sut = makeSUT()

        assertThatRetrieveHasNoSideEffectsOnEmptyCache(on: sut)
    }

    func test_retrieve_deliversFailureOnRetrievalError() {
//        // MARK: Adapt to CoreData
//        let sut = makeSUT()
//
//        assertThatRetrieveDeliversFailureOnRetrievalError(on: sut)
    }

    func test_retrieve_hasNoSideEffectsOnFailure() {
//        // MARK: Adapt to CoreData
//        let sut = makeSUT()
//
//        assertThatRetrieveHasNoSideEffectsOnFailure(on: sut)
    }

    func test_insert_deliversNoErrorOnEmptyCache() {
        let sut = makeSUT()

        assertThatInsertDeliversNoErrorOnEmptyCache(on: sut)
    }

    func test_insert_deliversNoErrorOnNonEmptyCache() {
        let sut = makeSUT()

        assertThatInsertDeliversNoErrorOnNonEmptyCache(on: sut)
    }

    func test_insert_overridesPreviouslyInsertedCacheValues() {
        let sut = makeSUT()

        assertThatInsertOverridesPreviouslyInsertedCacheValues(on: sut)
    }

    func test_insert_deliversErrorOnInsertionError() {
//        let invalidStoreURL = URL(string: "invalid://store-url")!
//        let sut = makeSUT(storeURL: invalidStoreURL)
//
//        assertThatInsertDeliversErrorOnInsertionError(on: sut)
    }

    func test_insert_hasNoSideEffectsOnInsertionError() {
//        let invalidStoreURL = URL(string: "invalid://store-url")!
//        let sut = makeSUT(storeURL: invalidStoreURL)
//
//        assertThatInsertHasNoSideEffectsOnInsertionError(on: sut)
    }

    func test_delete_deliversNoErrorOnEmptyCache() {
        let sut = makeSUT()

        assertThatDeleteDeliversNoErrorOnEmptyCache(on: sut)
    }

    func test_delete_hasNoSideEffectsOnEmptyCache() {
        let sut = makeSUT()

        assertThatDeleteHasNoSideEffectsOnEmptyCache(on: sut)
    }

    func test_delete_deliversNoErrorOnNonEmptyCache() {
        let sut = makeSUT()

        assertThatDeleteDeliversNoErrorOnNonEmptyCache(on: sut)
    }

    func test_delete_emptiesPreviouslyInsertedCache() {
        let sut = makeSUT()

        assertThatDeleteEmptiesPreviouslyInsertedCache(on: sut)
    }

    func test_delete_deliversErrorOnDeletionError() {
//        // MARK: Adapt to CoreData
//        let sut = makeSUT()
//
//        assertThatDeleteDeliversErrorOnDeletionError(on: sut)
    }

    func test_delete_hasNoSideEffectsOnDeletionError() {
//        // MARK: Adapt to CoreData
//        let sut = makeSUT()
//
//        assertThatDeleteHasNoSideEffectsOnDeletionError(on: sut)
    }

    func test_storeSideEffects_runSerially() {
//        let sut = makeSUT()
//
//        assertThatSideEffectsRunSerially(on: sut)
    }

    // MARK: - Helpers
    private func makeSUT(file: StaticString = #file, line: UInt = #line) -> FeedStore {
        let storeBundle = Bundle(for: CoreDataFeedStore.self)
        let storeURL = URL(fileURLWithPath: "/dev/null")
        let sut = try! CoreDataFeedStore(storeURL: storeURL, bundle: storeBundle)
        trackForMemoryLeaks(sut, file: file, line: line)
        return sut
    }
}
