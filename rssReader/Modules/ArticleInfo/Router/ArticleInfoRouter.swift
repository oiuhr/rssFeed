//
//  ArticleInfoRouter.swift
//  rssReader
//
//  Created by Ryzhov Eugene on 29.10.2020.
//

import UIKit

class ArticleInfoRouter {
    
    weak var viewController: UIViewController!
    
}

extension ArticleInfoRouter: ArticleInfoRouterInput {
    
    func close() {
        
        viewController.dismiss(animated: true, completion: nil)
        
    }
    
}
