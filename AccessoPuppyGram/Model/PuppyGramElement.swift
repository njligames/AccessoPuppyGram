//
//  PuppyGramElement.swift
//  AccessoPuppyGram
//
//  Created by James Folk on 7/26/22.
//

import Foundation

struct PuppyGramElement: Codable {
    let items: [Item]

    enum CodingKeys: String, CodingKey {
        case items
    }
}

struct Item: Codable, Identifiable, Equatable {
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id = UUID()
    let title: String
    let media: Media
    let published: Date
    let author: String

    enum CodingKeys: String, CodingKey {
        case title, media
        case published, author
    }
}

struct Media: Codable {
    let m: String
}

