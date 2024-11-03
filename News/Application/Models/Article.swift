//
//  News.swift
//  News
//
//  Created by Nitin George on 03/11/2024.
//

import Foundation

// MARK: - ArticleResponse
struct ArticleResponse: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let author: String?
    let url: String
    let source, title, description: String
    let image: String
    let date: Date
}
