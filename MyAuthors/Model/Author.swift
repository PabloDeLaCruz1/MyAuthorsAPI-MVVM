//
//  Author.swift
//  MyAuthors
//
//  Created by Pablo De La Cruz on 7/13/22.
//

import Foundation

// MARK: - Author
//Model structure for above JSON response
struct Author: Codable {
    let authorID: Int?
    let authorName: String
    let books: [Book]
    let welcomeAuthorID: Int?

    //CodingKeys to handle exceptions for the case sensitive data attributes from JSON response
    enum CodingKeys: String, CodingKey {
        case authorID = "authorId"
        case authorName, books
        case welcomeAuthorID = "author_id"
    }
}

// MARK: - Book
struct Book: Codable {
    let title: String
    let coverImage: String
    let pages: Int
    let releaseDate: String
    let isbn: String?
    let id: Int?
    let authorName: String?

    enum CodingKeys: String, CodingKey {
        case title
        case coverImage = "cover_image"
        case pages, releaseDate, isbn, id, authorName
    }
}

