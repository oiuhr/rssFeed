//
//  ArticleInfoAssembly.swift
//  rssReader
//
//  Created by Ryzhov Eugene on 29.10.2020.
//

import UIKit

class ArticleInfoAssembly {
    
    func articleInfoModule(presenting article: Article) -> ArticleInfoViewController {
        
        let view = ArticleInfoViewController()
        let presenter = ArticleInfoPresenter(article: article)
        let router = ArticleInfoRouter()
        
        router.viewController = view
        
        view.input = presenter
        view.output = presenter
        
        presenter.view = view
        presenter.router = router
        
        presenter.configure(with: article)
        
        return view
        
    }
    
}
