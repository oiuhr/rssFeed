//
//  ArticleInfoPresenter.swift
//  rssReader
//
//  Created by Ryzhov Eugene on 29.10.2020.
//

import Foundation

class ArticleInfoPresenter {
    
    init(article: Article) {
        self.article = article
    }
    
    private var article: Article
    
    var view: ArticleInfoViewController!
    var router: ArticleInfoRouter!
    
}

extension ArticleInfoPresenter: ArticleInfoViewInput {
    
    func configure(with article: Article) {
        self.article = article
        view.configure(with: article)
    }
    
}

extension ArticleInfoPresenter: ArticleInfoViewOutput {
    
    func closeButtonTapped() {
        
        router.close()
        
    }
    
}
