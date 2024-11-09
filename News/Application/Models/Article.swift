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

struct Article: Codable, Identifiable {
    var id: UUID = UUID()
    var author: String?
    var url: String?
    var source: String?
    var title: String?
    var description: String?
    var image: String?
    var date: Date?

    enum CodingKeys: String, CodingKey {
        case author, url, source,title,
             image, date, description
    }
    
    init(
        id: UUID = UUID(),
        author: String? = nil,
        url: String? = nil,
        source: String? = nil,
        title: String? = nil,
        description: String? = nil,
        image: String? = nil,
        date: Date? = nil
    ) {
        self.id = id
        self.author = author
        self.url = url
        self.source = source
        self.title = title
        self.description = description
        self.image = image
        self.date = date
    }
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
