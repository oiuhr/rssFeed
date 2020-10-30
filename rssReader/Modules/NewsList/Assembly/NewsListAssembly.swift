//
//  NewsListAssembly.swift
//  rssReader
//
//  Created by Ryzhov Eugene on 29.10.2020.
//

class NewsListAssembly {
    
    func newsListModule() -> NewsListViewController {
        
        let view = NewsListViewController()
        let presenter = NewsListPresenter()
        let interactor = NewsListInteractor()
        let router = NewsListRouter()
        
        view.output = presenter
        
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        
        router.viewController = view
        
        return view
        
    }
    
}
