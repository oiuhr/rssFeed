//
//  CategoriesListRouter.swift
//  rssReader
//
//  Created by Ryzhov Eugene on 30.10.2020.
//

import UIKit

class CategoriesListRouter {
    
    weak var viewController: UIViewController!
    var delegate: NewsListViewDelegate!
    
}

extension CategoriesListRouter: CategoriesListRouterInput {
    
    func close(send items: [String]) {
        
        delegate.getCategories(categories: items)
        viewController.dismiss(animated: true, completion: nil)
        
    }
    
}

