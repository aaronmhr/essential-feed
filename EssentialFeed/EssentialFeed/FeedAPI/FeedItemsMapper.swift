//
//  FeedItemsMapper.swift
//  EssentialFeed
//
//  Created by Aaron Huánuco on 12/09/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import Foundation

internal final class FeedItemsMapper {
    struct Root: Decodable {
        let items: [Item]

        var feed: [FeedItem] {
            items.map { $0.item }
        }
    }

    struct Item: Decodable {
        let id: UUID
        let description: String?
        let location: String?
        let image: URL

        var item: FeedItem {
            FeedItem(id: id, description: description, location: location, imageURL: image)
        }
    }

    private static var OK_200: Int { 200 }

    internal static func map(_ data: Data, from response: HTTPURLResponse) -> RemoteFeedLoader.Result {
        guard response.statusCode == OK_200,
            let root = try? JSONDecoder().decode(Root.self, from: data) else {
                return .failure(RemoteFeedLoader.Error.invalidData)
        }
        return .success(root.feed)
    }
}
