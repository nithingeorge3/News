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
    let url: String?
    let source, title, description: String?
    let image: String?
    let date: Date?
}


extension Article {
    
    static var dummyData: Article {
        .init(author: "Alex Will",
              url: "https://www.bbc.co.uk/news/live/c2e7jdjdmplt",
              source: "BBC News",
              title: "Biden invites Trump to meet at White House next week",
              description: "President-Elect Donald Trump will meet Joe Biden in the Oval Office on Wednesday, the White House says, in their first encounter since the election",
              image: "https://ichef.bbci.co.uk/ace/standard/1024/cpsprodpb/c98e/live/ef98aa00-9eba-11ef-82c3-45a801b7330b.jpg",
              date: Date())
    }
}
