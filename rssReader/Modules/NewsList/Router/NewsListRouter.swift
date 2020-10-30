//
//  NewsListRouter.swift
//  rssReader
//
//  Created by Ryzhov Eugene on 29.10.2020.
//

import UIKit

class NewsListRouter {
    
    weak var viewController: UIViewController!
    
}

extension NewsListRouter: NewsListRouterInput {
    
    func openArticle(article: Article) {
        
        let module = ArticleInfoAssembly().articleInfoModule(presenting: article)
        
        let vc = UINavigationController(rootViewController: module)
        
        vc.modalPresentationStyle = .pageSheet
        vc.isModalInPresentation = true

        viewController.present(vc, animated: true, completion: nil)
        
    }
    
    func openCategories(categories: [String]) {
        
        let module = CategoriesListAssembly().categoriesListModule(presenting: categories, on: viewController)
        
        let vc = UINavigationController(rootViewController: module)
        vc.modalPresentationStyle = .pageSheet
        vc.isModalInPresentation = true

        viewController.present(vc, animated: true, completion: nil)
        
    }
    
}
