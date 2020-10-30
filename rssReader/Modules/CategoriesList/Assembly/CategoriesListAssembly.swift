//
//  CategoriesListAssembly.swift
//  rssReader
//
//  Created by Ryzhov Eugene on 30.10.2020.
//

import UIKit

class CategoriesListAssembly {
    
    func categoriesListModule(presenting categories: [String], on vc: UIViewController) -> CategoriesListViewController {
        
        let view = CategoriesListViewController()
        let presenter = CategoriesListPresenter(with: categories)
        let router = CategoriesListRouter()
        
        router.viewController = view
        router.delegate = vc as? NewsListViewDelegate
        
        view.output = presenter
        
//        presenter.view = view
        presenter.router = router
        
        return view
        
    }
    
}
