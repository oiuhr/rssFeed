//
//  NewsListRouterDelegate.swift
//  rssReader
//
//  Created by Ryzhov Eugene on 29.10.2020.
//

protocol NewsListRouterInput: class {
    
    func openArticle(article: Article)
    func openCategories(categories: [String])
    
}
