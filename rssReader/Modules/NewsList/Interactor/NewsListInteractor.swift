//
//  NewsListInteractor.swift
//  rssReader
//
//  Created by Ryzhov Eugene on 28.10.2020.
//

import Foundation

class NewsListInteractor {
    
    let requester = Requester()
    
}

extension NewsListInteractor: NewsListInteractorInput {
    
    func getNews() -> ([Article], [String]) {
        
        return requester.fetchArticles()
        
    }
    
}
