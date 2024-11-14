//
//  ArticleServiceFactory.swift
//  NetworkModule
//
//  Created by Nitin George on 14/11/2024.
//

import Foundation

public class ArticleServiceFactory {
    
    public static func articleService() -> ArticleServiceType {
        return ArticleServiceImpl()
    }
}
