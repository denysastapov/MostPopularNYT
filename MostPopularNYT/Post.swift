//
//  Post.swift
//  MostPopularNYT
//
//  Created by Denys Astapov on 22.05.2021.
//

import Foundation

// MARK: - Post
struct Post: Codable {
    let status, copyright: String
    let numResults: Int
    let results: [Result]?

    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case results
    }
}

// MARK: - Result
struct Result: Codable {
    let title: String?
    let abstract: String?

    enum CodingKeys: String, CodingKey {
        case abstract
        case title
    }
       init(dictionaryPost: [String: Any]) {
           title = dictionaryPost["title"] as? String
           abstract = dictionaryPost["abstract"] as? String
       }
        static func getPosts(from jsonData: Any) -> [Result] {
            guard let jsonData = jsonData as? Array<[String: Any]> else { return [] }
            return jsonData.compactMap { Result(dictionaryPost: $0) }
        }
}

// MARK: - Media
struct Media: Codable {
    let type: MediaType
    let subtype: Subtype
    let caption, copyright: String
    let approvedForSyndication: Int
    let mediaMetadata: [MediaMetadatum]

    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
}

// MARK: - MediaMetadatum
struct MediaMetadatum: Codable {
    let url: String
    let format: Format
    let height, width: Int
}

enum Format: String, Codable {
    case mediumThreeByTwo210 = "mediumThreeByTwo210"
    case mediumThreeByTwo440 = "mediumThreeByTwo440"
    case standardThumbnail = "Standard Thumbnail"
}

enum Subtype: String, Codable {
    case empty = ""
    case photo = "photo"
}

enum MediaType: String, Codable {
    case image = "image"
}

enum Source: String, Codable {
    case newYorkTimes = "New York Times"
}

enum ResultType: String, Codable {
    case article = "Article"
    case interactive = "Interactive"
}
