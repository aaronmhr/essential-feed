//
//  RemoteFeedLoadertests.swift
//  EssentialFeedTests
//
//  Created by Aaron Huánuco on 11/09/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import XCTest
import EssentialFeed

class RemoteFeedLoaderTests: XCTestCase {
    func test_init_doesNotRequestDataFromURL() {
        let (_, client) = makeSUT()

        XCTAssert(client.requestedURLs.isEmpty)
    }

    func test_load_requestsDataFromURL() {
        let url = URL(string: "https://a-given-url.com")!
        let (sut,  client) = makeSUT(url: url)

        sut.load { _ in }

        XCTAssertEqual(client.requestedURLs, [url])
    }

    func test_loadTwice_requestsDataFromURLTwice() {
        let url = URL(string: "https://a-given-url.com")!
        let (sut,  client) = makeSUT(url: url)

        sut.load { _ in }
        sut.load { _ in }

        XCTAssertEqual(client.requestedURLs, [url, url])
    }

    func test_load_deliversErrorOnClientError() {
        let (sut, client) = makeSUT()

        var capturedError: [RemoteFeedLoader.Error] = []
        sut.load { capturedError.append($0) }

        let clientError = NSError(domain: "Test", code: 0)
        client.complete(with: clientError)

        XCTAssertEqual(capturedError, [.connectivity])
    }

    func test_load_deliversErrorOnNon200HTTPResponse() {
        let (sut, client) = makeSUT()

        let samples = [199, 201, 300, 400, 500].enumerated()

        samples.forEach { index, code in
            var capturedErrors: [RemoteFeedLoader.Error] = []
            sut.load { capturedErrors.append($0) }

            client.complete(withStatusCode: code, at: index)

            XCTAssertEqual(capturedErrors, [.invalidData])
        }
    }

    func test_load_deliversErrorOn200HTTPresponseWithInvalidJSON() {
        let (sut, client) = makeSUT()

        var capturedError: [RemoteFeedLoader.Error] = []
        sut.load { capturedError.append($0) }

        let invalidJSON = Data("invalid json".utf8)

        client.complete(withStatusCode: 200, data: invalidJSON)

        XCTAssertEqual(capturedError, [.invalidData])
    }
    // MARK: - Helpers

    private func makeSUT(url: URL = URL(string: "https://a-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (sut, client)
    }

    private class HTTPClientSpy: HTTPClient {
        private var messages: [(url: URL, completion: (HTTPClientResult) -> Void)] = []

        var requestedURLs: [URL] {
            messages.map(\.url)
        }

        func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void) {
            messages.append((url, completion))
        }

        func complete(with error: Error, at index: Int = 0) {
            messages[index].completion(.failure(error))
        }

        func complete(withStatusCode code: Int, data: Data = Data(), at index: Int = 0) {
            let response = HTTPURLResponse(
                url: requestedURLs[index],
                statusCode: code,
                httpVersion: nil,
                headerFields: nil)!
            messages[index].completion(.success(data, response))
        }
    }
}
